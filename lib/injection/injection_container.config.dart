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
import '../core/platform/network_info.dart' as _i9;
import '../core/services/mock_reader_service.dart' as _i8;
import '../core/services/notification_service/notification_service.dart'
    as _i10;
import '../core/services/premium_services/premium_services.dart' as _i11;
import '../data/repositories/user_repo/data_sources/user_http_repository.dart'
    as _i6;
import '../data/repositories/user_repo/data_sources/user_mock_repository.dart'
    as _i7;
import '../data/repositories/user_repo/user_repository.dart' as _i15;
import '../data/services/hive_service/hive_service.dart' as _i4;
import '../data/services/quote_and_category_service/quote_and_category_service.dart'
    as _i12;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i13;
import '../domain/repositories/user_repository/data_sources/ilocal_repository.dart'
    as _i16;
import '../domain/repositories/user_repository/data_sources/iremote_repository.dart'
    as _i5;
import '../domain/repositories/user_repository/i_user_repository.dart' as _i14;

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
  gh.lazySingleton<_i5.IUserRemoteRepository>(
    () => _i6.UserHttpRepository(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i5.IUserRemoteRepository>(
    () => _i7.UserMockRepository(),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.MockReaderService>(() => _i8.MockReaderService());
  gh.lazySingleton<_i9.NetworkInfo>(() => _i9.NetworkInfoImpl());
  gh.lazySingleton<_i10.NotificationService>(() => _i10.NotificationService());
  gh.lazySingleton<_i11.PremiumServices>(() => _i11.PremiumServices());
  gh.lazySingleton<_i12.QuoteAndCategoryService>(
      () => _i12.QuoteAndCategoryService());
  gh.lazySingleton<_i13.ThemeConfigurationService>(
      () => _i13.ThemeConfigurationService());
  gh.lazySingleton<_i14.IUserRepository>(() => _i15.UserRepository(
        remoteDataSource: gh<_i5.IUserRemoteRepository>(),
        localDataSource: gh<_i16.IUserLocalRepository>(),
        networkInfo: gh<_i9.NetworkInfo>(),
      ));
  return getIt;
}
