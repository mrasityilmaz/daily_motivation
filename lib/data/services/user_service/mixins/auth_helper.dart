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

      // It just a basic template user model to keep userUid to identify the user
      // If the user is not created, it will create the user
      // If the user is created, it will get the real user model not this template
      final newUser = UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        // if the user is not created, it will create the user with the current time
        createdAt: DateTime.now(),
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
    } on CustomException catch (e, s) {
      printCatchLog(e, s, 'getSignedUserAccount');
    } catch (e, s) {
      printCatchLog(e, s, 'getSignedUserAccount');
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      if (userHasSignUpWithEmail && !FirebaseAuth.instance.currentUser!.emailVerified) {
        // TODO - ActionCodeSettings
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }
    } catch (e, s) {
      printCatchLog(e, s, 'sendEmailVerification');
    }
  }

  /// {@macro UserService.userHasSignUpWithEmail}
  @override
  bool get userHasSignUpWithEmail {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }

    return FirebaseAuth.instance.currentUser!.providerData
        .any((providerProfile) => providerProfile.providerId == 'password');
  }
}
