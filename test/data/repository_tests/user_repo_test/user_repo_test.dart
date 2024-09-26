import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' show Environment;
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/firestore_models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/firebase_options.dart';
import 'package:quotely/injection/injection_container.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FakeFirestore User Collection Tests', () {
    late final IUserRepository userMockRepository;
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

    setUpAll(() {
      configureDependencies(defaultEnv: Environment.test);
      userMockRepository = locator<IUserRepository>();
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

  group('Firestore User Collection Tests', () {
    late final IUserRepository userRepository;
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

    setUpAll(() async {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.ios);
      configureDependencies(defaultEnv: Environment.prod);
      userRepository = locator<IUserRepository>();
    });

    test('Create User', () async {
      final result = await userRepository.createNewUser(userModel: userModel);
      expect(result.isRight(), true);

      expect(result.asRight(), isA<UserModel>());

      expect(result.asRight(), userModel);
    });

    test('Update User', () async {
      final result = await userRepository.updateUser(userModel: userModel.copyWith(sendNotifications: true));
      expect(result.isRight(), true);

      expect(result.asRight(), isA<UserModel>());

      expect(result.asRight().sendNotifications, !userModel.sendNotifications);
    });

    test('Delete User', () async {
      final result = await userRepository.deleteUser(userId: userModel.deviceId);
      expect(result.isRight(), true);

      expect(result.asRight(), true);
    });

    test('Find User By Device Id', () async {
      final result = await userRepository.findUserByDeviceId(deviceId: userModel.deviceId);
      expect(result.isRight(), false);
    });

    tearDownAll(locator.reset);
  });
}
