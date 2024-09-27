// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/navigator/app_navigator.dart' as _i3;
import '../core/platform/network_info.dart' as _i6;
import '../core/services/mock_reader_service.dart' as _i5;
import '../core/services/notification_service/notification_service.dart' as _i7;
import '../core/services/premium_services/premium_services.dart' as _i8;
import '../data/repositories/user_repo/data_sources/user_firestore_repository.dart'
    as _i14;
import '../data/repositories/user_repo/data_sources/user_hive_repository.dart'
    as _i12;
import '../data/repositories/user_repo/data_sources/user_mock_repository.dart'
    as _i15;
import '../data/repositories/user_repo/user_repository.dart' as _i17;
import '../data/services/hive_service/hive_service.dart' as _i4;
import '../data/services/quote_and_category_service/quote_and_category_service.dart'
    as _i9;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i10;
import '../domain/repositories/user_repository/data_sources/ilocal_repository.dart'
    as _i11;
import '../domain/repositories/user_repository/data_sources/iremote_repository.dart'
    as _i13;
import '../domain/repositories/user_repository/i_user_repository.dart' as _i16;

const String _prod = 'prod';
const String _test = 'test';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.HiveService>(() => _i4.HiveService());
  gh.lazySingleton<_i5.MockReaderService>(() => _i5.MockReaderService());
  gh.lazySingleton<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl());
  gh.lazySingleton<_i7.NotificationService>(() => _i7.NotificationService());
  gh.lazySingleton<_i8.PremiumServices>(() => _i8.PremiumServices());
  gh.lazySingleton<_i9.QuoteAndCategoryService>(
      () => _i9.QuoteAndCategoryService());
  gh.lazySingleton<_i10.ThemeConfigurationService>(
      () => _i10.ThemeConfigurationService());
  gh.lazySingleton<_i11.UserLocalRepository>(
      () => _i12.UserHiveRepositoryImpl());
  gh.lazySingleton<_i13.UserRemoteRepository>(
    () => const _i14.UserHttpRepositoryImpl(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i13.UserRemoteRepository>(
    () => _i15.UserMockRepositoryImpl(),
    registerFor: {_test},
  );
  gh.lazySingleton<_i16.UserRepository>(() => _i17.UserRepositoryImpl(
        remoteDataSource: gh<_i13.UserRemoteRepository>(),
        localDataSource: gh<_i11.UserLocalRepository>(),
      ));
  return getIt;
}
