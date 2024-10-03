import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotely/data/firebase/callables/firebase_callables.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';

class UserService {
  Future<void> checkAndCreateUser() async {}

  Future<String> createCustomToken({
    required String uid,
    required String deviceId,
  }) async {
    try {
      FirebaseCallables.generateCustomToken.callable.call(
        <String, dynamic>{
          'uid': uid,
          'deviceId': deviceId,
        },
      );
      final callableResult =
          await FirebaseFunctions.instance.httpsCallable('generateCustomToken').call<Map<String, dynamic>>(
        {
          'uid': uid,
          'deviceId': deviceId,
        },
      );

      if (callableResult.data.isNotEmpty && callableResult.data.containsKey('token')) {
        return callableResult.data['token'] as String;
      } else {
        throw Exception('Token could not be created');
      }
    } on FirebaseFunctionsException catch (error) {
      print(error.code);
      print(error.details);
      print(error.message);
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> createUserWithCustomToken({
    required String token,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithCustomToken(token);

      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        print('User created with custom token: ${currentUser.uid}');

        await locator<UserRepository>().createNewUser(userModel: UserModel(deviceId: currentUser.uid));
      }
    } catch (e) {
      print(e);
    }
  }
}
