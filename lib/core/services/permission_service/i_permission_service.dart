import 'package:permission_handler/permission_handler.dart';

abstract class IBasePermission {
  /// This function will check the permission
  /// If the permission is granted, it will return true
  /// If the permission is not granted, it will return false
  Future<PermissionStatus> checkPermission({required Permission permission});

  /// This function will request the permission
  /// If the permission is granted, it will return true
  /// If the permission is not granted, it will return false
  Future<PermissionStatus> requestPermission({
    required Permission permission,
    void Function()? onGranted,
    void Function()? onDenied,
    void Function()? onPermanentlyDenied,
    bool openAppSettingsWhenPermanentlyDenied = false,
  });
}
