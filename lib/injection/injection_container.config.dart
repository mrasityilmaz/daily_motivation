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
import '../core/platform/network_info.dart' as _i10;
import '../core/services/mock_reader_service.dart' as _i9;
import '../core/services/notification_service/notification_service.dart' as _i11;
import '../core/services/premium_services/premium_services.dart' as _i12;
import '../data/repositories/example_repo/data_sources/example_http_repository.dart' as _i7;
import '../data/repositories/example_repo/data_sources/example_mock_repository.dart' as _i8;
import '../data/repositories/example_repo/example_repository.dart' as _i16;
import '../data/services/hive_service/hive_service.dart' as _i5;
import '../data/services/quote_and_category_service/quote_and_category_service.dart' as _i13;
import '../data/services/theme_configuration_service/theme_configuration_service.dart' as _i14;
import '../domain/repositories/example_repository/data_sources/ilocal_repository.dart' as _i17;
import '../domain/repositories/example_repository/data_sources/iremote_repository.dart' as _i6;
import '../domain/repositories/example_repository/i_example_repository.dart' as _i15;

const String _real = 'real';
const String _mock = 'mock';

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

  gh.lazySingleton<_i5.HiveService>(() => _i5.HiveService());
  gh.lazySingleton<_i6.IExampleRemoteRepository>(
    () => _i7.ExampleHttpRepository(),
    registerFor: {_real},
  );
  gh.lazySingleton<_i6.IExampleRemoteRepository>(
    () => _i8.ExampleMockRepository(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i9.MockReaderService>(() => _i9.MockReaderService());
  gh.lazySingleton<_i10.NetworkInfo>(() => _i10.NetworkInfoImpl());
  gh.lazySingleton<_i11.NotificationService>(() => _i11.NotificationService());
  gh.lazySingleton<_i12.PremiumServices>(() => _i12.PremiumServices());
  gh.lazySingleton<_i13.QuoteAndCategoryService>(() => _i13.QuoteAndCategoryService());
  gh.lazySingleton<_i14.ThemeConfigurationService>(() => _i14.ThemeConfigurationService());
  gh.lazySingleton<_i15.IExampleRepository>(() => _i16.ExampleRepository(
        remoteDataSource: gh<_i6.IExampleRemoteRepository>(),
        localDataSource: gh<_i17.IExampleLocalRepository>(),
        networkInfo: gh<_i10.NetworkInfo>(),
      ));
  return getIt;
}
