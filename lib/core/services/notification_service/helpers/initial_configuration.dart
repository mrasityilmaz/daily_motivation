// ignore_for_file: unused_local_variable

part of '../notification_service.dart';

@immutable
final class _InitialConfigurationBase with _AndroidInitializationHelper, _DarwinInitializationHelper, _LinuxInitializationHelper, _NotificationConstantVariables {
  ///
  ///
  ///
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final MethodChannel platform = const MethodChannel('dexterx.dev/flutter_local_notifications_example');

  ///
  /// Configure Timezone
  ///

  Future<void> configureLocalTimeZone() async {
    try {
      if (kIsWeb || Platform.isLinux) {
        return;
      }
      tz.initializeTimeZones();
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      LoggerService.instance.printLog('configureLocalTimeZone');
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// Indicates if the app was launched via notification.
  /// TODO - Configure initial route if the app was launched via notification
  ///
  Future<void> configureAppLaunchDetails() async {
    try {
      late final NotificationAppLaunchDetails? notificationAppLaunchDetails;

      if (!kIsWeb && Platform.isLinux) {
        notificationAppLaunchDetails = null;
      } else {
        notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
      }

      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        final String? notificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload;

        /// TODO - USE [notificationPayload] if the app was launched via notification.
      }
      LoggerService.instance.printLog('configureAppLaunchDetails');
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// Base Initialization Settings
  ///
  InitializationSettings get initializationSettings => InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        macOS: initializationSettingsDarwin,
        linux: initializationSettingsLinux,
      );

  ///
  /// Initialize Local Notification Plugin
  ///
  Future<void> initializeLocalNotificationPlugin() async {
    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          print('object');
          switch (notificationResponse.notificationResponseType) {
            case NotificationResponseType.selectedNotification:
            //     selectNotificationStream.add(notificationResponse.payload);
            case NotificationResponseType.selectedNotificationAction:
              if (notificationResponse.actionId == navigationActionId) {
                //  selectNotificationStream.add(notificationResponse.payload);
              }
          }
        },
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );
      LoggerService.instance.printLog('initializeLocalNotificationPlugin');
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
