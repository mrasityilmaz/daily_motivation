part of '../user_service.dart';

base mixin _UserHelper on _IUserService {
  @override
  @protected
  set user(UserModel? value) {
    if (value == null) {
      printLog('User Not Updated - User is null', context: 'setUser');
    } else {
      final oldValue = _user.value;
      _user.value = value;
      if (oldValue != null) {
        printLog('User Updated - ${value.toJson().diffEntriesToString(oldValue.toJson())}', context: 'setUser');
      }
    }
  }

  /// {@macro UserService.updateUser}
  @override
  @protected
  Future<void> _updateUser(UserModel userModel) async {
    try {
      await _userRepository.updateUser(userModel: userModel).then((value) {
        if (value.isRight()) {
          user = value.asRight();
        }
      });
    } catch (e, s) {
      printCatchLog(e, s, 'updateUser');
    }
  }

  /// {@macro UserService.setUserRequiredFields}
  @override
  @protected
  Future<void> setUserRequiredFields() async {
    try {
      if (FirebaseAuth.instance.currentUser == null || user == null) {
        return;
      }

      final List<dynamic> getFields = await Future.wait([
        FirebaseMessaging.instance.getToken(),
        FlutterTimezone.getLocalTimezone(),
        if (user!.sendNotifications != null || user!.sendNotifications != false) Permission.notification.isGranted,
      ]);

      final String? deviceToken = getFields.elementAt(0) as String?;

      final String? timeZone = getFields.elementAtOrNull(1) as String?;

      final bool? notificationPermission = getFields.elementAtOrNull(2) as bool?;

      final DateTime? createdAt = user?.createdAt != null ? null : DateTime.now();

      /// !Do not update any other fields here
      final settableUser = user!.copyWith(
        deviceToken: deviceToken,
        timeZone: timeZone,
        sendNotifications: notificationPermission,
        createdAt: createdAt,
      );

      // If the user is not changed, then return
      if (settableUser == user) {
        return;
      }
      // If the user is changed, then update the user
      else {
        await _updateUser(settableUser);
      }
    } catch (e, s) {
      printCatchLog(e, s, 'setUserRequiredFields');
    }
  }
}
