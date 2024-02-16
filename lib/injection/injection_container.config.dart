// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/constants/premium_constants/premium_constants.dart' as _i9;
import '../core/navigator/app_navigator.dart' as _i3;
import '../core/platform/network_info.dart' as _i8;
import '../core/services/mock_reader_service.dart' as _i7;
import '../core/services/premium_services/premium_services.dart' as _i10;
import '../data/repositories/example_repo/data_sources/example_http_repository.dart'
    as _i5;
import '../data/repositories/example_repo/data_sources/example_mock_repository.dart'
    as _i6;
import '../data/repositories/example_repo/example_repository.dart' as _i14;
import '../data/services/category_service/quote_and_category_service.dart'
    as _i11;
import '../data/services/theme_configuration_service/theme_configuration_service.dart'
    as _i12;
import '../domain/repositories/example_repository/data_sources/ilocal_repository.dart'
    as _i15;
import '../domain/repositories/example_repository/data_sources/iremote_repository.dart'
    as _i4;
import '../domain/repositories/example_repository/i_example_repository.dart'
    as _i13;

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
  gh.lazySingleton<_i4.IExampleRemoteRepository>(
    () => _i5.ExampleHttpRepository(),
    registerFor: {_real},
  );
  gh.lazySingleton<_i4.IExampleRemoteRepository>(
    () => _i6.ExampleMockRepository(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i7.MockReaderService>(() => _i7.MockReaderService());
  gh.lazySingleton<_i8.NetworkInfo>(() => _i8.NetworkInfoImpl());
  gh.lazySingleton<_i9.PremiumConstants>(() => _i9.PremiumConstants());
  gh.lazySingleton<_i10.PremiumServices>(() => _i10.PremiumServices());
  gh.lazySingleton<_i11.QuoteAndCategoryService>(
      () => _i11.QuoteAndCategoryService());
  gh.lazySingleton<_i12.ThemeConfigurationService>(
      () => _i12.ThemeConfigurationService());
  gh.lazySingleton<_i13.IExampleRepository>(() => _i14.ExampleRepository(
        remoteDataSource: gh<_i4.IExampleRemoteRepository>(),
        localDataSource: gh<_i15.IExampleLocalRepository>(),
        networkInfo: gh<_i8.NetworkInfo>(),
      ));
  return getIt;
}
