import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

abstract class IUserRemoteRepository {
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel});
  Future<DataModel<UserModel>> findUserByDeviceId({required String deviceId});
  Future<DataModel<UserModel>> updateUser({required UserModel userModel});
  Future<DataModel<bool>> deleteUser({required String userId});
}
