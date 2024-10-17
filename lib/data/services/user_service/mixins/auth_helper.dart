part of '../user_service.dart';

base mixin _AuthHelper on _IUserService {
  @override
  @protected
  Future<void> getSignedUserAccount() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        printLog('User is not signed in', context: 'getSignedUserAccount');
        return;
      }

      final newUser = UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
      );

      final createdOrAlreadyCreatedUser = await _userRepository.createNewUser(userModel: newUser);

      if (createdOrAlreadyCreatedUser.isRight()) {
        user = createdOrAlreadyCreatedUser.asRight();
        printLog(
          'User Signed In - ${createdOrAlreadyCreatedUser.asRight().uid}',
          context: 'getSignedUserAccount',
        );
      } else {
        // TODO-handle error
      }
    } catch (e, s) {
      printCatchLog(e, s, 'getSignedUserAccount');
    }
  }
}
