import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

abstract class UserRepository {
  const UserRepository();

  /// {@macro UserRemoteRepository.createNewUser}
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel});

  /// {@macro UserRemoteRepository.findUserByUid}
  Future<DataModel<UserModel>> findUserByUid({required String uid});

  /// {@macro UserRemoteRepository.updateUser}
  Future<DataModel<UserModel>> updateUser({required UserModel userModel});

  /// {@macro UserRemoteRepository.deleteUser}
  Future<DataModel<bool>> deleteUser({required String uid});

  /// {@macro UserRemoteRepository.signInAnonymously}
  Future<DataModel<UserModel>> signInAnonymously();
}
