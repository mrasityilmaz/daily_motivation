part of 'font_settings_bottom_sheet.dart';

final class _FontSettingsBottomSheetViewModel extends ReactiveViewModel {
  _FontSettingsBottomSheetViewModel({required this.quoteModel});
  late final QuoteModel quoteModel;

  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  ThemeConfigurationService get _listenableThemeConfigurationService => listenableServices.first as ThemeConfigurationService;

  ThemeConfigurationModel get currentThemeConfiguration => _listenableThemeConfigurationService.currentThemeConfiguration;

  List<String> get allBackgroundList => _themeConfigurationService.allBackgroundList;
  List<DefaultFontsEnum> get allDefaultFontList => _themeConfigurationService.defaultFontList;

  Future<void> updateThemeConfiguration({required ThemeConfigurationModel model}) async {
    await _themeConfigurationService.changeThemeConfiguration(model: model);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeConfigurationService,
      ];
}
