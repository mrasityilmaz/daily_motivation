import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';

abstract class UserLocalRepository {
  const UserLocalRepository();

  void saveUser({required UserModel userModel});
  UserModel? getUser();
  void deleteUser();
}
