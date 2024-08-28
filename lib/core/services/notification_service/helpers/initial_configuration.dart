// ignore_for_file: unused_local_variable

part of '../notification_service.dart';

@immutable
class _InitialConfigurationBase
    with _AndroidInitializationHelper, _DarwinInitializationHelper, _LinuxInitializationHelper {
  ///
  ///
  ///
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final MethodChannel _platform = const MethodChannel('dexterx.dev/flutter_local_notifications_example');

  ///
  /// Configure Timezone
  ///
  @nonVirtual
  Future<void> _configureLocalTimeZone() async {
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
  @nonVirtual
  Future<void> _configureAppLaunchDetails() async {
    try {
      late final NotificationAppLaunchDetails? notificationAppLaunchDetails;

      if (!kIsWeb && Platform.isLinux) {
        notificationAppLaunchDetails = null;
      } else {
        notificationAppLaunchDetails = await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
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
  InitializationSettings get _initializationSettings => InitializationSettings(
        android: _initializationSettingsAndroid,
        iOS: _initializationSettingsDarwin,
        macOS: _initializationSettingsDarwin,
        linux: _initializationSettingsLinux,
      );

  ///
  /// Initialize Local Notification Plugin
  ///
  @nonVirtual
  Future<void> _initializeLocalNotificationPlugin() async {
    try {
      await _flutterLocalNotificationsPlugin.initialize(
        _initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          stderr.write(notificationResponse.toString());
          switch (notificationResponse.notificationResponseType) {
            case NotificationResponseType.selectedNotification:
              stderr.write(notificationResponse.payload);
            //     selectNotificationStream.add(notificationResponse.payload);
            case NotificationResponseType.selectedNotificationAction:
              if (notificationResponse.actionId == _navigationActionId) {
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

  ///
  /// Init Notification Service
  ///
  @mustCallSuper
  Future<void> initService() async {
    await _configureLocalTimeZone();
    await _configureAppLaunchDetails();
    await _initializeLocalNotificationPlugin();
  }
}
