import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/data/repositories/user_repository/data_sources/user_hive_repository.dart';
import 'package:quotely/data/repositories/user_repository/data_sources/user_mock_repository.dart';
import 'package:quotely/data/repositories/user_repository/user_repository.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';

void main() {
  group('FakeFirestore User Collection Tests', () {
    late final UserRepository userMockRepository;
    final UserModel userModel = UserModel(
      uid: '123',
      deviceId: '123',
      timeZone: 'Asia/Kolkata',
      deviceToken: '1234',
      lastScheduledDate: DateTime.now().toUtc(),
    );

    setUpAll(() async {
      locator
        ..registerSingleton<FirebaseFirestore>(
          FakeFirebaseFirestore(),
        )
        ..registerFactory<UserRepository>(
          () => const UserRepositoryImpl(
            remoteDataSource: UserMockRepositoryImpl(),
            localDataSource: UserHiveRepositoryImpl(),
          ),
        );

      await locator.allReady();

      userMockRepository = locator<UserRepository>();
    });

    test('Dependency Check', () {
      expect(userMockRepository, isA<UserRepository>());
      expect(locator.isRegistered<UserRepository>(), true);
    });

    test('Create User', () async {
      final result = await userMockRepository.createNewUser(userModel: userModel);
      expect(result.isRight(), true);

      expect(result.asRight(), isA<UserModel>());

      expect(result.asRight().deviceId, userModel.deviceId);

      expect(result.asRight().deviceToken, userModel.deviceToken);

      expect(result.asRight().timeZone, userModel.timeZone);

      expect(result.asRight().lastScheduledDate, userModel.lastScheduledDate);

      expect(result.asRight().sendNotifications, userModel.sendNotifications);

      expect(result.asRight().scheduleTimes, userModel.scheduleTimes);
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
