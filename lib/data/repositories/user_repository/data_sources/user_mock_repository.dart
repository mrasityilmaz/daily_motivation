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
  CollectionReference<Map<String, Object?>?> get _collection => FireStoreCollections.users.collectionWithoutConverter;

  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) async {
    try {
      final hasAlreadyCreated = await findUserByUid(uid: userModel.uid);

      if (hasAlreadyCreated.isRight()) {
        return hasAlreadyCreated;
      }
      // Using set instead of add to avoid creating a new document with a random id
      await _collection.doc(userModel.uid).set(userModel.toMap());
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<bool>> deleteUser({required String uid}) async {
    try {
      await _collection.doc(uid).delete();

      return const Right(true);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) async {
    try {
      await _collection.doc(userModel.uid).update(userModel.toMap());
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> findUserByUid({required String uid}) async {
    try {
      final user = await _collection.doc(uid).get().then((value) => value.data());

      if (user != null) {
        return Right(UserModel.userFromMap(user));
      }
      return Left(FirestoreException(errorMessage: 'User not found'));
    } catch (e) {
      return Left(FirestoreException(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }
}
