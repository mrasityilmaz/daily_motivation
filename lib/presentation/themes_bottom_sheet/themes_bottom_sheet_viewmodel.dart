part of 'themes_bottom_sheet.dart';

final class _ThemesBottomSheetViewModel extends ReactiveViewModel with PremiumConstantThemeConfigMixin {
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();

  final PremiumServices _premiumServices = locator<PremiumServices>();

  ThemeConfigurationService get _listenableThemeConfigurationService => listenableServices.first as ThemeConfigurationService;
  PremiumServices get _listenablePremiumServices => listenableServices[1] as PremiumServices;

  bool get userIsPremium => _listenablePremiumServices.isPremium;

  bool isThemeConfigPremium(int index) => shouldUserWatchAdToUnlockTheme(index: index, userIsPremium: userIsPremium);

  ThemeConfigurationModel get currentThemeConfiguration => _listenableThemeConfigurationService.currentThemeConfiguration;

  List<String> get allBackgroundList => _themeConfigurationService.allBackgroundList;
  List<DefaultFontsEnum> get allDefaultFontList => _themeConfigurationService.defaultFontList;

  Future<void> updateThemeConfiguration({required ThemeConfigurationModel model}) async {
    await runBusyFuture(Future.delayed(const Duration(milliseconds: 500), () => _themeConfigurationService.changeThemeConfiguration(model: model)));
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeConfigurationService,
        _premiumServices,
      ];
}
