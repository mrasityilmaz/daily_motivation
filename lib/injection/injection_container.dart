import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  generateForDir: [
    'lib',
    'test',
  ],
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({String? defaultEnv}) async {
  final environment = getEnvironment(defaultEnv: defaultEnv);
  //
  // Hive Service
  locator.registerLazySingletonAsync<HiveService>(() async {
    final service = HiveService();
    await service.init();
    return service;
  });

  await locator.isReady<HiveService>();

  ///
  /// Registering the Firestore instance based on the environment
  if (environment == Environment.prod) {
    locator.registerSingleton<FirebaseFirestore>(
      FirebaseFirestore.instance,
    );
  } else {
    locator.registerSingleton<FirebaseFirestore>(
      FakeFirebaseFirestore(),
    );
  }

  ///

  $initGetIt(
    locator,
    environment: environment,
  );
}

String getEnvironment({String? defaultEnv}) {
  final data = defaultEnv ?? const String.fromEnvironment('ENVIRONMENT');
  return switch (data) {
    Environment.prod => Environment.prod,
    Environment.test => Environment.test,
    _ => Environment.test,
  };
}
