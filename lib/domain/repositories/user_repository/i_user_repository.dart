import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

abstract class UserRepository {
  const UserRepository();

  /// {@macro UserRemoteRepository.createNewUser}
  Future<EitherOr<UserModel>> createNewUser({required UserModel userModel});

  /// {@macro UserRemoteRepository.findUserByUid}
  Future<EitherOr<UserModel>> findUserByUid({required String uid});

  /// {@macro UserRemoteRepository.updateUser}
  Future<EitherOr<UserModel>> updateUser({required UserModel userModel});

  /// {@macro UserRemoteRepository.deleteUser}
  Future<EitherOr<bool>> deleteUser({required String uid});
}
