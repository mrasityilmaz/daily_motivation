// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/navigator/app_navigator.dart' as _i15;
import '../core/platform/network_info.dart' as _i3;
import '../core/services/notification_service/notification_service.dart' as _i4;
import '../core/services/premium_services/premium_services.dart' as _i5;
import '../data/repositories/user_repo/data_sources/user_firestore_repository.dart'
    as _i11;
import '../data/repositories/user_repo/data_sources/user_hive_repository.dart'
    as _i9;
import '../data/repositories/user_repo/data_sources/user_mock_repository.dart'
    as _i12;
import '../data/repositories/user_repo/user_repository.dart' as _i14;
import '../data/services/hive_service/hive_service.dart' as _i16;
import '../data/services/quote_and_category_service/quote_and_category_service.dart'
    as _i6;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i7;
import '../domain/repositories/user_repository/data_sources/ilocal_repository.dart'
    as _i8;
import '../domain/repositories/user_repository/data_sources/iremote_repository.dart'
    as _i10;
import '../domain/repositories/user_repository/i_user_repository.dart' as _i13;

const String _prod = 'prod';
const String _test = 'test';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.NetworkInfo>(() => _i3.NetworkInfoImpl());
  gh.factory<_i4.NotificationService>(() => _i4.NotificationService());
  gh.lazySingleton<_i5.PremiumServices>(() => _i5.PremiumServices());
  gh.lazySingleton<_i6.QuoteAndCategoryService>(
      () => _i6.QuoteAndCategoryService());
  gh.lazySingleton<_i7.ThemeConfigurationService>(
      () => _i7.ThemeConfigurationService());
  gh.factory<_i8.UserLocalRepository>(() => const _i9.UserHiveRepositoryImpl());
  gh.factory<_i10.UserRemoteRepository>(
    () => const _i11.UserHttpRepositoryImpl(),
    registerFor: {_prod},
  );
  gh.factory<_i10.UserRemoteRepository>(
    () => const _i12.UserMockRepositoryImpl(),
    registerFor: {_test},
  );
  gh.factory<_i13.UserRepository>(
    () => _i14.UserRepositoryImpl(
      remoteDataSource: gh<_i10.UserRemoteRepository>(),
      localDataSource: gh<_i8.UserLocalRepository>(),
    ),
    registerFor: {
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i15.AppRouter>(() => _i15.AppRouter());
  await gh.lazySingletonAsync<_i16.HiveService>(
    () {
      final i = _i16.HiveService();
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  return getIt;
}
