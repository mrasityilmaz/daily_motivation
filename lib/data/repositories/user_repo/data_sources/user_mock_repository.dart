import 'package:cloud_firestore/cloud_firestore.dart' hide FirebaseFirestore;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/firestore/collections/firestore_collections.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';

@immutable
@LazySingleton(as: UserRemoteRepository, env: [Environment.test])
final class UserMockRepositoryImpl implements UserRemoteRepository {
  const UserMockRepositoryImpl();
  CollectionReference<Map<String, Object?>?> get _collection => FireStoreCollections.users.collectionWithoutConverter;

  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) async {
    try {
      final hasAlreadyCreated = await findUserByDeviceId(deviceId: userModel.deviceId);

      if (hasAlreadyCreated.isRight()) {
        return hasAlreadyCreated;
      }
      // Using set instead of add to avoid creating a new document with a random id
      await _collection.doc(userModel.deviceId).set(userModel.toMap());
      return await findUserByDeviceId(deviceId: userModel.deviceId);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<bool>> deleteUser({required String userId}) async {
    try {
      await _collection.doc(userId).delete();

      return const Right(true);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) async {
    try {
      await _collection.doc(userModel.deviceId).update(userModel.toMap());
      return await findUserByDeviceId(deviceId: userModel.deviceId);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> findUserByDeviceId({required String deviceId}) async {
    try {
      final user = await _collection.doc(deviceId).get().then((value) => value.data());

      if (user != null) {
        return Right(UserModel.userFromMap(user));
      }
      return Left(FirestoreException(errorMessage: 'User not found'));
    } catch (e) {
      return Left(FirestoreException(errorMessage: e.toString()));
    }
  }
}
