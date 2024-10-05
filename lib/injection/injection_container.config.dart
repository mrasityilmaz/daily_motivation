// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/navigator/app_navigator.dart' as _i22;
import '../core/platform/network_info.dart' as _i10;
import '../core/services/notification_service/notification_service.dart'
    as _i11;
import '../core/services/premium_services/premium_services.dart' as _i12;
import '../data/repositories/auth_repository/auth_repository.dart' as _i9;
import '../data/repositories/auth_repository/data_sources/auth_functions_repository.dart'
    as _i7;
import '../data/repositories/auth_repository/data_sources/auth_hive_repository.dart'
    as _i4;
import '../data/repositories/auth_repository/data_sources/auth_mock_repository.dart'
    as _i6;
import '../data/repositories/user_repository/data_sources/user_firestore_repository.dart'
    as _i18;
import '../data/repositories/user_repository/data_sources/user_hive_repository.dart'
    as _i16;
import '../data/repositories/user_repository/data_sources/user_mock_repository.dart'
    as _i19;
import '../data/repositories/user_repository/user_repository.dart' as _i21;
import '../data/services/hive_service/hive_service.dart' as _i23;
import '../data/services/quote_and_category_service/quote_and_category_service.dart'
    as _i13;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i14;
import '../domain/repositories/auth_repository/data_sources/ilocal_repository.dart'
    as _i3;
import '../domain/repositories/auth_repository/data_sources/iremote_repository.dart'
    as _i5;
import '../domain/repositories/auth_repository/i_auth_repository.dart' as _i8;
import '../domain/repositories/user_repository/data_sources/ilocal_repository.dart'
    as _i15;
import '../domain/repositories/user_repository/data_sources/iremote_repository.dart'
    as _i17;
import '../domain/repositories/user_repository/i_user_repository.dart' as _i20;

const String _test = 'test';
const String _prod = 'prod';

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
  gh.factory<_i3.AuthLocalRepository>(() => const _i4.AuthHiveRepositoryImpl());
  gh.factory<_i5.AuthRemoteRepository>(
    () => const _i6.AuthMockRepositoryImpl(),
    registerFor: {_test},
  );
  gh.factory<_i5.AuthRemoteRepository>(
    () => const _i7.AuthHttpRepositoryImpl(),
    registerFor: {_prod},
  );
  gh.factory<_i8.AuthRepository>(
    () => _i9.AuthRepositoryImpl(
      remoteDataSource: gh<_i5.AuthRemoteRepository>(),
      localDataSource: gh<_i3.AuthLocalRepository>(),
    ),
    registerFor: {
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i10.NetworkInfo>(() => _i10.NetworkInfoImpl());
  gh.factory<_i11.NotificationService>(() => _i11.NotificationService());
  gh.lazySingleton<_i12.PremiumServices>(() => _i12.PremiumServices());
  gh.lazySingleton<_i13.QuoteAndCategoryService>(
      () => _i13.QuoteAndCategoryService());
  gh.lazySingleton<_i14.ThemeConfigurationService>(
      () => _i14.ThemeConfigurationService());
  gh.factory<_i15.UserLocalRepository>(
      () => const _i16.UserHiveRepositoryImpl());
  gh.factory<_i17.UserRemoteRepository>(
    () => const _i18.UserHttpRepositoryImpl(),
    registerFor: {_prod},
  );
  gh.factory<_i17.UserRemoteRepository>(
    () => const _i19.UserMockRepositoryImpl(),
    registerFor: {_test},
  );
  gh.factory<_i20.UserRepository>(
    () => _i21.UserRepositoryImpl(
      remoteDataSource: gh<_i17.UserRemoteRepository>(),
      localDataSource: gh<_i15.UserLocalRepository>(),
    ),
    registerFor: {
      _prod,
      _test,
    },
  );
  gh.lazySingleton<_i22.AppRouter>(() => _i22.AppRouter());
  await gh.lazySingletonAsync<_i23.HiveService>(
    () {
      final i = _i23.HiveService();
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  return getIt;
}
