import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
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
    debugPrint('NotificationService Initialized');

    await _checkNotificationPermission();

    await super.initService();
  }

  Future<void> showNotification() async {
    final int id = Random().nextInt(100);
    await _flutterLocalNotificationsPlugin.show(
      id,
      'Test-$id',
      'Hello',
      const NotificationDetails(
        iOS: DarwinNotificationDetails(),
      ),
      payload: 'Payload Test-$id',
    );
  }

  Future<void> scheduleNotifications({required ReminderModel reminderModel}) async {
    try {
      // await _flutterLocalNotificationsPlugin.zonedSchedule(reminderModel.notificationId, reminderModel.notificationTitle, body, scheduledDate, notificationDetails, uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation)
    } catch (e) {}
  }
}
