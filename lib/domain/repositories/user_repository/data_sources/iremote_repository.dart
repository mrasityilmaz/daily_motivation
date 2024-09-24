import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/user_model/user_model.dart';

abstract class IUserRemoteRepository {
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel});
  Future<DataModel<UserModel>> getUser({required String userId});
  Future<DataModel<UserModel>> updateUser({required UserModel userModel});
  Future<DataModel<UserModel>> deleteUser({required String userId});
}
