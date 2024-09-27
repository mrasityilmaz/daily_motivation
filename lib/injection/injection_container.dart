import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/injection/injection_container.config.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
void configureDependencies({String? defaultEnv}) {
  final environment = getEnvironment(defaultEnv: defaultEnv);
  //
  locator.registerLazySingleton<ThemeService>(
    ThemeService.getInstance,
  );

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
