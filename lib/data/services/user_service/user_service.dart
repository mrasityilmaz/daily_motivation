import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/core/extensions/map_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/data/services/hive_service/boxes/user_box.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

part 'i_user_service.dart';
part 'mixins/auth_helper.dart';
part 'mixins/user_helper.dart';

@immutable
@Singleton(order: 3)
final class UserService extends _IUserService with _UserHelper, _AuthHelper {
  @override
  UserRepository get _userRepository => locator<UserRepository>();
  @override
  UserBoxService get _userBoxService => locator<HiveService>().userBoxService;

  /// {@macro UserRemoteRepository}
  @override
  @protected
  @PostConstruct(preResolve: true)
  Future<void> initUser() async {
    try {
      await getSignedUserAccount();
      await setUserRequiredFields();
    } catch (e, s) {
      printCatchLog(e, s, 'initUser');
    }
  }

  // SERVICE GETTERS
  @override
  UserModel? get user => _user.value;
  User? get firebaseUser => FirebaseAuth.instance.currentUser;
  bool get isLoggedIn => firebaseUser != null && user != null;

  bool get hasLocalUser => _userBoxService.hasUser;
  UserModel? get userFromLocal => _userBoxService.getUser;
}
