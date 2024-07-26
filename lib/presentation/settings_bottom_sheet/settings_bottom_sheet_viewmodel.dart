part of 'settings_bottom_sheet.dart';

final class _SettingsBottomSheetViewModel extends BaseViewModel {
  final AppRouter appRouter = locator<AppRouter>();

  void toggleTheme() {
    locator<ThemeService>().toggleDarkLightTheme();
  }

  Future<void> pushRoute(auto_route.PageRouteInfo<dynamic> route) async {
    await appRouter.push(route);
  }
}
