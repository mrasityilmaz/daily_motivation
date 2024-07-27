part of '../../notification_service.dart';

mixin _LinuxInitializationHelper {
  ///
  /// Main Linux Initialization Setting
  ///
  final LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(
    defaultActionName: 'Open notification',
    defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  );
}
