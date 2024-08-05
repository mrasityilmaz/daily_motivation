part of '../../notification_service.dart';

mixin _PermissionHandlerMixin on _InitialConfigurationBase {
  ///
  /// Notification Permission Status
  ///
  final ValueNotifier<bool> isNotificationPermissionGranted = ValueNotifier<bool>(false);

  ///
  ///
  /// Check Notification Permission
  ///
  @nonVirtual
  Future<void> _checkNotificationPermission() async {
    try {
      final PermissionStatus status = await Permission.notification.status;

      final bool isGranted = status.isGranted || status.isLimited;

      if (isGranted) {
        isNotificationPermissionGranted.value = true;
      } else {
        isNotificationPermissionGranted.value = false;
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
      isNotificationPermissionGranted.value = false;
    }
  }

  ///
  ///
  /// Request Notification Permission
  ///
  @nonVirtual
  Future<bool> requestNotificationPermission({VoidCallback? onGrantedAction, VoidCallback? onPermanentDeniedAction, bool openAppSettingsWhenPermanentlyDenied = false}) async {
    try {
      final PermissionStatus status = await Permission.notification.onGrantedCallback(onGrantedAction).onPermanentlyDeniedCallback(() {
        onPermanentDeniedAction?.call();
        if (openAppSettingsWhenPermanentlyDenied) {
          openAppSettings();
        }
      }).request();

      final bool isGranted = status.isGranted || status.isLimited;

      LoggerService.instance.printLog('NotificationPermissionStatus : $isGranted - $status');

      if (isGranted) {
        isNotificationPermissionGranted.value = true;
        return true;
      } else {
        isNotificationPermissionGranted.value = false;
        return false;
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
      isNotificationPermissionGranted.value = false;
      return false;
    }
  }
}
