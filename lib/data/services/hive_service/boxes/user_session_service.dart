import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/data/models/user_session_model/user_session_model.dart';

@immutable
final class UserSessionBoxService extends HiveBoxService<UserSessionModel> {
  UserSessionBoxService() : super(boxName: HiveConstants.sessionBoxKey, fromJson: UserSessionModel.fromMap);

  bool get hasSession => box.containsKey(boxName) && getUserSession != null && getUserSession?.sessionToken != null;

  void saveUserSession(UserSessionModel userSessionModel) {
    try {
      box.put(boxName, userSessionModel);
    } catch (e, stackTrace) {
      debugPrint('Error saving user session: $e ,\n StackTrace: $stackTrace');
    }
  }

  UserSessionModel? get getUserSession {
    try {
      return box.get(boxName);
    } catch (e, stackTrace) {
      debugPrint('Error getting user session: $e ,\n StackTrace: $stackTrace');
      return null;
    }
  }

  void deleteUserSession() {
    try {
      box.delete(boxName);
    } catch (e, stackTrace) {
      debugPrint('Error deleting user session: $e ,\n StackTrace: $stackTrace');
    }
  }

  void updateLastLoginTime() {
    try {
      final userSession = getUserSession;
      if (userSession != null) {
        saveUserSession(userSession.copyWith(lastLoginTime: DateTime.now()));
      }
    } catch (e, stackTrace) {
      debugPrint('Error updating last login time: $e ,\n StackTrace: $stackTrace');
    }
  }
}
