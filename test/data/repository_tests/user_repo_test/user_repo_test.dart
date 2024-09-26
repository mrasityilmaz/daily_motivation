import 'package:flutter_test/flutter_test.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/data/repositories/user_repo/data_sources/user_mock_repository.dart';

void main() {
  final UserMockRepository userMockRepository = UserMockRepository();
  const UserModel userModel = UserModel(
    deviceId: '123',
    timeZone: 'Asia/Kolkata',
    deviceInfo: {
      'deviceName': 'iPhone 12',
      'deviceModel': 'iPhone 12',
      'deviceOs': 'iOS',
      'deviceOsVersion': '14.5',
    },
    deviceToken: '1234',
  );

  group('User Collection Tests', () {
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
  });
}
