// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../config/navigator/app_router.dart' as _i857;
import '../core/platform/network_info.dart' as _i461;
import '../core/services/notification_service/notification_service.dart'
    as _i1000;
import '../core/services/premium_services/premium_services.dart' as _i414;
import '../data/repositories/user_repository/data_sources/user_firestore_repository.dart'
    as _i862;
import '../data/repositories/user_repository/data_sources/user_hive_repository.dart'
    as _i576;
import '../data/repositories/user_repository/data_sources/user_mock_repository.dart'
    as _i452;
import '../data/repositories/user_repository/user_repository.dart' as _i668;
import '../data/services/hive_service/hive_service.dart' as _i851;
import '../data/services/quote_and_category_service/quote_and_category_service.dart'
    as _i283;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i529;
import '../data/services/user_service/user_service.dart' as _i362;
import '../domain/repositories/user_repository/data_sources/ilocal_repository.dart'
    as _i31;
import '../domain/repositories/user_repository/data_sources/iremote_repository.dart'
    as _i510;
import '../domain/repositories/user_repository/i_user_repository.dart' as _i698;

const String _test = 'test';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i1000.NotificationService>(() => _i1000.NotificationService());
  gh.lazySingleton<_i414.PremiumServices>(() => _i414.PremiumServices());
  gh.lazySingleton<_i283.QuoteAndCategoryService>(
      () => _i283.QuoteAndCategoryService());
  gh.lazySingleton<_i529.ThemeConfigurationService>(
      () => _i529.ThemeConfigurationService());
  gh.factory<_i31.UserLocalRepository>(
      () => const _i576.UserHiveRepositoryImpl());
  gh.lazySingleton<_i461.NetworkInfo>(() => _i461.NetworkInfoImpl());
  gh.factory<_i510.UserRemoteRepository>(
    () => const _i452.UserMockRepositoryImpl(),
    registerFor: {_test},
  );
  gh.factory<_i698.UserRepository>(
    () => _i668.UserRepositoryImpl(
      remoteDataSource: gh<_i510.UserRemoteRepository>(),
      localDataSource: gh<_i31.UserLocalRepository>(),
    ),
    registerFor: {
      _prod,
      _test,
    },
  );
  gh.factory<_i510.UserRemoteRepository>(
    () => const _i862.UserHttpRepositoryImpl(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i857.AppRouter>(() => _i857.AppRouter());
  await gh.lazySingletonAsync<_i851.HiveService>(
    () {
      final i = _i851.HiveService();
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  await gh.singletonAsync<_i362.UserService>(
    () {
      final i = _i362.UserService();
      return i.initUser().then((_) => i);
    },
    preResolve: true,
  );
  return getIt;
}
