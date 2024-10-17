import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

/// {@template UserRemoteRepository}
///  1. Check has user session model in local
///  2. Check has user model in local
///  3. Compare user model with user session model -> if not equal, re-sync user model
///
///  4. If userSessionModel has a session token and last login time is less than 1 hour and not null
///     - Check the Firebase.auth.currentUser
///     - If currentUser is null, sign in user with session token
///     - If currentUser is not null, check if currentUser.uid is equal to userSessionModel.uid
///     - If currentUser.uid is not equal to userSessionModel.uid, sign in user with session token
///     - If currentUser.uid is equal to userSessionModel.uid, update user model with currentUser data, update last login time
///
///
///  5. If userSessionModel has a session token and last login time is more than 1 hour or null
///     - More than 1 hour;
///       - Generate new session token with userId
///       - Save new session token in userSessionModel with last login time
///       - Sign in user with new session token
///       - Update user model with currentUser data
///     - Null;
///       - Check user model in local
///       - If user model is null, create new unique userId,
///         generate new session token with userId,
///         save new session token in userSessionModel with last login time
///         then sign in user with new session token
///        update user model with currentUser data
///       - If user model is not null, generate new session token with userId in local user model,
///         save new session token in userSessionModel with last login time
///         then sign in user with new session token
///         update user model with currentUser data
/// {@endtemplate}
abstract class UserRemoteRepository {
  const UserRemoteRepository();

  /// TODO : Heal the comments

  /// {@template UserRemoteRepository.createNewUser}
  /// Creates a new user in the database.
  /// - Returns: A [Future] that resolves to a [EitherOr] containing the user data as a [UserModel].
  /// {@endtemplate}
  Future<EitherOr<UserModel>> createNewUser({required UserModel userModel});

  /// {@template UserRemoteRepository.findUserByUid}
  /// Finds the user by the user id.
  /// - Returns: A [Future] that resolves to a [EitherOr] containing the user data as a [UserModel].
  /// {@endtemplate}
  Future<EitherOr<UserModel>> findUserByUid({required String uid});

  /// {@template UserRemoteRepository.updateUser}
  /// Updates the user in the database.
  /// - Returns: A [Future] that resolves to a [EitherOr] containing the updated user data as a [UserModel].
  /// {@endtemplate}
  Future<EitherOr<UserModel>> updateUser({required UserModel userModel});

  /// {@template UserRemoteRepository.deleteUser}
  /// Deletes the user from the database.
  /// - Returns: A [Future] that resolves to a [EitherOr] containing a [bool] value.
  /// - If the user is deleted successfully, it will return true.
  /// - If the user is not deleted successfully, it will return false.
  /// {@endtemplate}
  Future<EitherOr<bool>> deleteUser({required String uid});
}
