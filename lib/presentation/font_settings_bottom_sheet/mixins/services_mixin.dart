part of '../font_settings_bottom_sheet.dart';

mixin ServicesMixin on ReactiveViewModel {
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  ThemeConfigurationService get _listenableThemeConfigurationService => listenableServices.first as ThemeConfigurationService;

  ThemeConfigurationModel get currentThemeConfiguration => _listenableThemeConfigurationService.currentThemeConfiguration;

  List<String> get allBackgroundList => _themeConfigurationService.allBackgroundList;
  List<DefaultFontsEnum> get allDefaultFontList => _themeConfigurationService.defaultFontList;
}
