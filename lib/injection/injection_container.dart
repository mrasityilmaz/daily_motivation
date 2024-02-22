import 'package:cookie_jar/cookie_jar.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/constants/api_constants.dart';
import 'package:quotely/core/extensions/list_extension.dart';
import 'package:quotely/data/repositories/example_repo/data_sources/example_hive_repository.dart';
import 'package:quotely/domain/repositories/example_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/injection/injection_container.config.dart';
import 'package:rest_api_package/requests/rest_api_request.dart';
import 'package:rest_api_package/rest_api_package.dart';
import 'package:stacked_themes/stacked_themes.dart';

final locator = GetIt.instance;
late final DataType environmentTag;

enum DataType {
  real,
  mock,
}

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
  if (defaultEnv == null) {
    const data = String.fromEnvironment('DATA_TYPE');
    environmentTag = DataType.values.firstWhereOrDefault((element) => element.name == data, defaultValue: DataType.mock);
  } else {
    environmentTag = DataType.values.firstWhereOrDefault((element) => element.name == defaultEnv, defaultValue: DataType.mock);
  }

  ///
  /// Registiration of RestApiHttpService
  ///
  await _initSource<RestApiHttpService>(
    source: RestApiHttpService(Dio(), DefaultCookieJar(), APIConstants.baseURL),
  );

  await _initSource<ThemeService>(
    source: ThemeService.getInstance(),
  );

  ///
  /// Register all local repositories
  ///
  /// You have to register all local repositories here.
  ///
  await _initSource<IExampleLocalRepository>(source: ExampleHiveRepository());

  $initGetIt(
    locator,
    environment: environmentTag.name,
  );
}

///
/// Register all sources
///
Future<void> _initSource<T extends Object>({required T source}) async {
  // await source.init();
  locator.registerLazySingleton<T>(
    () => source,
  );
}
