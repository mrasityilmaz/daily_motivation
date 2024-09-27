import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';

@immutable
@LazySingleton(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final UserRemoteRepository remoteDataSource;
  final UserLocalRepository localDataSource;

  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) async {
    return remoteDataSource.createNewUser(userModel: userModel);
  }

  @override
  Future<DataModel<bool>> deleteUser({required String userId}) {
    return remoteDataSource.deleteUser(userId: userId);
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) {
    return remoteDataSource.updateUser(userModel: userModel);
  }

  @override
  Future<DataModel<UserModel>> findUserByDeviceId({required String deviceId}) {
    return remoteDataSource.findUserByDeviceId(deviceId: deviceId);
  }
}
