import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';

@immutable
@Injectable(as: UserRepository, env: [Environment.prod, Environment.test])
final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final UserRemoteRepository remoteDataSource;
  final UserLocalRepository localDataSource;

  @override
  Future<EitherOr<UserModel>> createNewUser({required UserModel userModel}) async {
    final EitherOr<UserModel> result = await remoteDataSource.createNewUser(userModel: userModel);

    /// When user is created, save the user
    if (result.isRight()) {
      localDataSource.saveUser(userModel: result.asRight());
    }

    return result;
  }

  @override
  Future<EitherOr<bool>> deleteUser({required String uid}) {
    return remoteDataSource.deleteUser(uid: uid);
  }

  @override
  Future<EitherOr<UserModel>> updateUser({required UserModel userModel}) async {
    final EitherOr<UserModel> result = await remoteDataSource.updateUser(userModel: userModel);

    /// When user is updated, save the user
    if (result.isRight()) {
      localDataSource.saveUser(userModel: result.asRight());
    }

    return result;
  }

  @override
  Future<EitherOr<UserModel>> findUserByUid({required String uid}) async {
    return remoteDataSource.findUserByUid(uid: uid);
  }
}
