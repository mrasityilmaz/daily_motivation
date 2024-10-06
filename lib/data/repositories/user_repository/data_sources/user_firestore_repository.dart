import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/firebase/collections/firestore_collections.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';

@immutable
@Injectable(as: UserRemoteRepository, env: [Environment.prod])
final class UserHttpRepositoryImpl implements UserRemoteRepository {
  const UserHttpRepositoryImpl();

  CollectionReference<UserModel?> get _userCollection => FireStoreCollections.users.collection;

  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) async {
    try {
      final hasAlreadyCreated = await findUserByUid(uid: userModel.uid);

      if (hasAlreadyCreated.isRight()) {
        return hasAlreadyCreated;
      }
      // Using set instead of add to avoid creating a new document with a random id
      await _userCollection.doc(userModel.uid).set(userModel);
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<bool>> deleteUser({required String uid}) async {
    try {
      await _userCollection.doc(uid).delete();

      return const Right(true);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) async {
    try {
      await _userCollection.doc(userModel.uid).update(userModel.toMap());
      return await findUserByUid(uid: userModel.uid);
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> findUserByUid({required String uid}) async {
    try {
      final user = await _userCollection.doc(uid).get().then((value) {
        return value.data();
      });

      if (user != null) {
        return Right(user);
      }
      return Left(FirestoreException(errorMessage: 'User not found'));
    } catch (e) {
      return Left(FirestoreException(errorMessage: e.toString()));
    }
  }

  @override
  Future<DataModel<UserModel>> signInAnonymously() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        final UserModel? user = await findUserByUid(uid: FirebaseAuth.instance.currentUser!.uid)
            .then((value) => value.fold((l) => null, (r) => r));

        if (user != null) {
          return Right(user);
        }
      }

      final UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

      if (userCredential.user?.uid == null) {
        return Left(FirestoreException(errorMessage: 'User could not be created'));
      }

      final newUser = await createNewUser(userModel: UserModel(uid: userCredential.user!.uid));

      if (newUser.isRight()) {
        return newUser;
      }

      return Left(FirestoreException(errorMessage: 'User could not be created'));
    } catch (e) {
      return Left(FirestoreException(errorMessage: e.toString()));
    }
  }
}
