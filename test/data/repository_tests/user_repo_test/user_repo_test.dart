import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' show Environment;
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FakeFirestore User Collection Tests', () {
    late final UserRepository userMockRepository;
    const UserModel userModel = UserModel(
      deviceId: '123',
      timeZone: 'Asia/Kolkata',
      deviceToken: '1234',
    );

    setUpAll(() {
      configureDependencies(defaultEnv: Environment.test);
      userMockRepository = locator<UserRepository>();
    });

    test('Create User', () async {
      final result = await userMockRepository.createNewUser(userModel: userModel);
      expect(result.isRight(), true);

      expect(result.asRight(), isA<UserModel>());

      expect(result.asRight(), userModel);
    });

    test('Update User', () async {
      final result = await userMockRepository.updateUser(userModel: userModel.copyWith(sendNotifications: true));
      expect(result.isRight(), true);

      expect(result.asRight(), isA<UserModel>());

      expect(result.asRight().sendNotifications, !userModel.sendNotifications);
    });

    test('Delete User', () async {
      final result = await userMockRepository.deleteUser(userId: userModel.deviceId);
      expect(result.isRight(), true);

      expect(result.asRight(), true);
    });

    test('Find User By Device Id', () async {
      final result = await userMockRepository.findUserByDeviceId(deviceId: userModel.deviceId);
      expect(result.isRight(), false);
    });

    tearDownAll(locator.reset);
  });
}
