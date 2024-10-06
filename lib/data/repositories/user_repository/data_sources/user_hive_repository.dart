import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/data/services/hive_service/boxes/user_box.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/injection/injection_container.dart';

@immutable
@Injectable(as: UserLocalRepository)
final class UserHiveRepositoryImpl implements UserLocalRepository {
  const UserHiveRepositoryImpl();

  UserBoxService get userBoxService => locator<HiveService>().userBoxService;

  @override
  void deleteUser() {
    try {
      userBoxService.deleteUserData();
    } catch (e, s) {
      debugPrint('Error deleting user: $e, $s');
    }
  }

  @override
  UserModel? getUser() {
    try {
      return userBoxService.getUser;
    } catch (e, s) {
      debugPrint('Error getting user: $e, $s');
      return null;
    }
  }

  @override
  void saveUser({required UserModel userModel}) {
    try {
      userBoxService.saveUserData(userModel);
    } catch (e, s) {
      debugPrint('Error saving user: $e, $s');
    }
  }
}
