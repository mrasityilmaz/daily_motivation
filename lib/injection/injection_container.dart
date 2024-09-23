import 'package:cookie_jar/cookie_jar.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/constants/api_constants.dart';
import 'package:quotely/data/repositories/user_repo/data_sources/user_hive_repository.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/injection/injection_container.config.dart';
import 'package:rest_api_package/requests/rest_api_request.dart';
import 'package:rest_api_package/rest_api_package.dart';
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
  ///
  /// Registiration of RestApiHttpService
  ///

  locator
    ..registerLazySingleton<RestApiHttpService>(
      () => RestApiHttpService(Dio(), DefaultCookieJar(), APIConstants.baseURL),
    )
    ..registerLazySingleton<ThemeService>(
      ThemeService.getInstance,
    )

    ///
    /// Register all local repositories
    ///
    /// You have to register all local repositories here.
    ///
    ..registerLazySingleton<IUserLocalRepository>(UserHiveRepository.new);

  $initGetIt(
    locator,
    environment: getEnvironment(),
  );
}

String getEnvironment() {
  const data = String.fromEnvironment('ENVIRONMENT');
  return switch (data) {
    Environment.dev => Environment.dev,
    Environment.prod => Environment.prod,
    Environment.test => Environment.test,
    _ => Environment.dev,
  };
}
