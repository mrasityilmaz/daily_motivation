import 'package:quotely/core/constants/enums/default_fonts_enum.dart';
import 'package:quotely/core/constants/premium_constants/theme_constants_mixin.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class ThemesBottomSheetViewModel extends ReactiveViewModel with PremiumConstantThemeConfigMixin {
  ///
  /// Define Services
  ///
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// Getters
  ///

  bool get userIsPremium => _premiumServices.isPremium;

  bool isThemeConfigPremium(int index) => shouldUserWatchAdToUnlockTheme(index: index, userIsPremium: userIsPremium);

  ThemeConfigurationModel get currentThemeConfiguration => _themeConfigurationService.currentThemeConfiguration;

  List<String> get allBackgroundList => _themeConfigurationService.allBackgroundList;
  List<DefaultFontsEnum> get allDefaultFontList => _themeConfigurationService.defaultFontList;

  ///
  /// Update Theme Config Function
  ///
  Future<void> updateThemeConfiguration({
    required ThemeConfigurationModel model,
  }) async {
    await _themeConfigurationService.changeThemeConfiguration(model: model);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeConfigurationService,
        _premiumServices,
      ];
}
