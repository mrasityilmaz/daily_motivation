import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/main.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'helpers/initial_configuration.dart';
part 'helpers/initialization_helpers/android_helper.dart';
part 'helpers/initialization_helpers/darwin_helper.dart';
part 'helpers/initialization_helpers/linux_helper.dart';
part 'helpers/permission_handlers/permission_handler.dart';

@lazySingleton
final class NotificationService extends _InitialConfigurationBase with _PermissionHandlerMixin {
  NotificationService();

  @override
  Future<void> initService() async {
    await _checkNotificationPermission();

    await super.initService();

    LoggerService.instance.printLog('Notification Service initialized - ${DateTime.now()}');
  }

  Future<void> showNotification({String message = 'Hello'}) async {
    final int id = Random().nextInt(100);
    await _flutterLocalNotificationsPlugin.show(
      id,
      'Test-$id',
      message,
      const NotificationDetails(
        iOS: DarwinNotificationDetails(),
      ),
      payload: 'Payload Test-$id',
    );
  }

  Future<void> scheduleNotifications({required ReminderModel reminderModel}) async {
    try {
      final List<TimeOfDay>? notificationTimes =
          reminderModel.notificationCustomIntervalSchedule?.notificationSchedules ??
              reminderModel.notificationEqualSchedule?.notificationSchedules;

      if (notificationTimes == null || notificationTimes.isEmpty || reminderModel.notificationDaysInWeek.isEmpty) {
        return;
      }

      // Loop through each selected day in the week
      for (final int day in reminderModel.notificationDaysInWeek) {
        // Loop through each notification time
        for (final TimeOfDay time in notificationTimes) {
          // Calculate the first occurrence of the notification
          tz.TZDateTime scheduledDate = _nextInstanceOfDayAndTime(day, time);

          // Schedule the notification for the next 4 weeks
          for (int i = 0; i < 4; i++) {
            await _flutterLocalNotificationsPlugin.zonedSchedule(
              // Create a unique ID for each notification
              reminderModel.notificationId.hashCode + i,
              reminderModel.notificationTitle,
              reminderModel.notificationBody,
              scheduledDate,
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  'daily notification channel',
                  'daily quotes notification ',
                  styleInformation: BigTextStyleInformation(''),
                  icon: 'app_icon',
                  importance: Importance.high,
                ),
                iOS: DarwinNotificationDetails(
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true,
                  threadIdentifier: 'daily_quotes_darwin',
                ),
              ),

              uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
              matchDateTimeComponents: DateTimeComponents.dateAndTime,
            );

            // Move to the next week's day
            scheduledDate = scheduledDate.add(const Duration(days: 7));
          }
        }
      }

      final aa = await _flutterLocalNotificationsPlugin.getActiveNotifications();

      print(aa);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  tz.TZDateTime _nextInstanceOfDayAndTime(int day, TimeOfDay time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // Calculate the base date for the given day of the week
    final tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // Calculate the difference between the current day and the target day
    int daysUntilTarget = day - now.weekday;

    // If the target day is earlier in the week, schedule for the next week
    if (daysUntilTarget < 0 || (daysUntilTarget == 0 && scheduledDate.isBefore(now))) {
      daysUntilTarget += 7;
    }

    return scheduledDate.add(Duration(days: daysUntilTarget));
  }

  Future<void> scheduleNotification({required DateTime time, String message = 'Hello'}) async {
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        time.hashCode,
        'Test',
        message,
        tz.TZDateTime.from(time, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily notification channel',
            'daily quotes notification ',
            styleInformation: BigTextStyleInformation(''),
            icon: 'app_icon',
            importance: Importance.high,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    } catch (e) {
      stderr.writeln(e);
    }
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}

