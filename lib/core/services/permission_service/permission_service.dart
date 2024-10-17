import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/permission_service/i_permission_service.dart';

@immutable
final class PermissionService with LoggerHelper implements IBasePermission {
  const PermissionService();

  @override
  Future<PermissionStatus> checkPermission({required Permission permission}) async {
    try {
      return await permission.status;
    } catch (e, s) {
      printCatchLog(e, s, 'checkPermission');
      return PermissionStatus.denied;
    }
  }

  @override
  Future<PermissionStatus> requestPermission({
    required Permission permission,
    void Function()? onGranted,
    void Function()? onDenied,
    void Function()? onPermanentlyDenied,
    bool openAppSettingsWhenPermanentlyDenied = false,
  }) async {
    try {
      final permissionResult = permission
        ..onDeniedCallback(onDenied)
        ..onGrantedCallback(onGranted)
        ..onPermanentlyDeniedCallback(() async {
          if (openAppSettingsWhenPermanentlyDenied) {
            await openAppSettings();
          }
          onPermanentlyDenied?.call();
        });

      return await permissionResult.request();
    } catch (e, s) {
      printCatchLog(e, s, 'requestPermission');
      return PermissionStatus.denied;
    }
  }
}
