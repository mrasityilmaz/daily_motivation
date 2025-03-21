import 'package:cloud_firestore/cloud_firestore.dart' hide FirebaseFirestore;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/firebase/collections/firestore_collections.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';

@immutable
@Injectable(as: UserRemoteRepository, env: [Environment.test])
final class UserMockRepositoryImpl implements UserRemoteRepository {
  const UserMockRepositoryImpl();
  CollectionReference<Map<String, Object?>?> get _collection =>
      FireStoreCollections.users.fakeCollectionWithoutConverter;

  @override
  Future<EitherOr<UserModel>> createNewUser({required UserModel userModel}) async {
    try {
      final hasAlreadyCreated = await findUserByUid(uid: userModel.uid);

      if (hasAlreadyCreated.isRight()) {
        return hasAlreadyCreated;
      }
      // Using set instead of add to avoid creating a new document with a random id
      await _collection.doc(userModel.uid).set(userModel.toJson());
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(UnExpectedException(errorMessage: error.toString()));
    }
  }

  @override
  Future<EitherOr<bool>> deleteUser({required String uid}) async {
    try {
      await _collection.doc(uid).delete();

      return const Right(true);
    } catch (error) {
      return Left(UnExpectedException(errorMessage: error.toString()));
    }
  }

  @override
  Future<EitherOr<UserModel>> updateUser({required UserModel userModel}) async {
    try {
      await _collection.doc(userModel.uid).update(userModel.toJson());
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(UnExpectedException(errorMessage: error.toString()));
    }
  }

  @override
  Future<EitherOr<UserModel>> findUserByUid({required String uid}) async {
    try {
      final user = await _collection.doc(uid).get().then((value) => value.data());

      if (user != null) {
        return Right(UserModel.fromJson(user));
      }
      return Left(UnExpectedException(errorMessage: 'User not found'));
    } catch (e) {
      return Left(UnExpectedException(errorMessage: e.toString()));
    }
  }
}
