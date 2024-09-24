import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/firestore/collections/firestore_collections.dart';
import 'package:quotely/data/models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';

@immutable
@Environment(Environment.prod)
@LazySingleton(as: IUserRemoteRepository)
final class UserHttpRepository implements IUserRemoteRepository {
  const UserHttpRepository();

  CollectionReference<UserModel?> get _userCollection => FireStoreCollections.users.collection;

  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) async {
    await _userCollection.doc(userModel.deviceId).set(userModel);
    return Right(userModel);
  }

  @override
  Future<DataModel<UserModel>> deleteUser({required String userId}) async {
    await _userCollection.doc(userId).delete();
    return const Right(UserModel(timeZone: '', deviceId: ''));
  }

  @override
  Future<DataModel<UserModel>> getUser({required String userId}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
