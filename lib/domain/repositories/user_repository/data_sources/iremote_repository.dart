import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

abstract class UserRemoteRepository {
  const UserRemoteRepository();

  /// {@template UserRemoteRepository.createNewUser}
  /// Creates a new user in the database.
  /// - Returns: A [Future] that resolves to a [DataModel] containing the user data as a [UserModel].
  /// {@endtemplate}
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel});

  /// {@template UserRemoteRepository.findUserByUid}
  /// Finds the user by the user id.
  /// - Returns: A [Future] that resolves to a [DataModel] containing the user data as a [UserModel].
  /// {@endtemplate}
  Future<DataModel<UserModel>> findUserByUid({required String uid});

  /// {@template UserRemoteRepository.updateUser}
  /// Updates the user in the database.
  /// - Returns: A [Future] that resolves to a [DataModel] containing the updated user data as a [UserModel].
  /// {@endtemplate}
  Future<DataModel<UserModel>> updateUser({required UserModel userModel});

  /// {@template UserRemoteRepository.deleteUser}
  /// Deletes the user from the database.
  /// - Returns: A [Future] that resolves to a [DataModel] containing a [bool] value.
  /// - If the user is deleted successfully, it will return true.
  /// - If the user is not deleted successfully, it will return false.
  /// {@endtemplate}
  Future<DataModel<bool>> deleteUser({required String uid});

  /// {@template UserRemoteRepository.signInAnonymously}
  /// Signs in the user anonymously.
  /// - If the user is already signed in, it will return the current user.
  /// - If the user is not signed in, it will sign in the user anonymously.
  /// - If the user is not created, it will create a new user in the database.
  /// - Returns: A [Future] that resolves to a [DataModel] containing the user data as a [UserModel].
  /// {@endtemplate}
  Future<DataModel<UserModel>> signInAnonymously();
}
