part of '../home_viewmodel.dart';

mixin _UILogicMixin {
  ///
  /// Show CategoriesBottomSheet
  ///
  Future<void> showCategoriesBottomSheet(BuildContext context) async {
    await _showBottomSheet(
      context,
      child: const CategoriesBottomSheet(),
    );
  }

  ///
  /// Show ThemesBottomSheet
  ///
  Future<void> showThemesBottomSheet(BuildContext context) async {
    await _showBottomSheet(
      context,
      child: const ThemesBottomSheet(),
    );
  }

  ///
  /// Show ThemesBottomSheet
  ///
  Future<void> showSettingsBottomSheet(BuildContext context) async {
    await _showBottomSheet(
      context,
      child: const SettingsBottomSheet(),
    );
  }

  ///
  /// Show BottomSheet Function
  ///
  Future<void> _showBottomSheet(BuildContext context, {required Widget child}) async {
    await AppDialogs.instance.showModalBottomSheetDialog<void>(
      context,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height * .9),
      elevation: 0,
      useRootNavigator: true,
      isScrollControlled: true,
      child: child,
    );
  }
}
