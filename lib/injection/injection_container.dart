import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
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

  ///
  /// Registering the Firestore instance based depend on the environment
  if (environment == Environment.prod) {
    locator.registerSingleton<FirebaseFirestore>(
      FirebaseFirestore.instance,
    );
  } else {
    locator.registerSingleton<FirebaseFirestore>(
      FakeFirebaseFirestore(),
    );
  }

  await $initGetIt(
    locator,
    environment: environment,
  );

  await locator.allReady();
}

String getEnvironment({String? defaultEnv}) {
  final data = (defaultEnv ?? const String.fromEnvironment('ENVIRONMENT')).toLowerCase();
  return switch (data) {
    Environment.prod => Environment.prod,
    Environment.test => Environment.test,
    _ => Environment.test,
  };
}
