import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/models/user_session_model/user_session_model.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/domain/repositories/auth_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/injection/injection_container.dart';

@immutable
@Injectable(as: AuthLocalRepository)
final class AuthHiveRepositoryImpl implements AuthLocalRepository {
  const AuthHiveRepositoryImpl();

  @override
  void saveToken({required String token, required String deviceId}) {
    try {
      final UserSessionModel userSessionModel =
          UserSessionModel(deviceId: deviceId, lastLoginTime: DateTime.now(), sessionToken: token);

      locator<HiveService>().userSessionBoxService.saveUserSession(userSessionModel);
    } catch (e, s) {
      debugPrint('Error saving token: $e, $s');
    }
  }

  @override
  void deleteToken() {
    try {
      locator<HiveService>().userSessionBoxService.deleteUserSession();
    } catch (e) {
      debugPrint('Error deleting token: $e');
    }
  }
}
