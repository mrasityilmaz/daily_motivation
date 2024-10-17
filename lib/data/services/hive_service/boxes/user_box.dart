import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

@immutable
final class UserBoxService extends HiveBoxService<UserModel> {
  UserBoxService() : super(boxName: HiveConstants.userBoxKey, fromJson: UserModel.fromJson);

  void saveUserData(UserModel userModel) {
    try {
      box.put(boxName, userModel);
    } catch (e, stackTrace) {
      debugPrint('Error saving user: $e ,\n StackTrace: $stackTrace');
    }
  }

  UserModel? get getUser {
    try {
      return box.get(boxName);
    } catch (e, stackTrace) {
      debugPrint('Error getting user: $e ,\n StackTrace: $stackTrace');
      return null;
    }
  }

  void deleteUserData() {
    try {
      box.delete(boxName);
    } catch (e, stackTrace) {
      debugPrint('Error deleting user: $e ,\n StackTrace: $stackTrace');
    }
  }

  bool get hasUser => box.containsKey(boxName) && box.get(boxName) != null;
}
