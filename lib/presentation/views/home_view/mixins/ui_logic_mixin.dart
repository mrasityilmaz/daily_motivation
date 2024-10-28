part of '../home_viewmodel.dart';

mixin _UILogicMixin {
  ///
  /// Show CategoriesBottomSheet
  ///
  Future<void> showCategoriesBottomSheet(BuildContext context) async {
    // await _showBottomSheet(
    //   context,
    //   child: const CategoriesBottomSheet(),
    // );

    // await showMaterialModalBottomSheet<void>(
    //   context: context,
    //   animationCurve: Curves.fastOutSlowIn,
    //   bounce: true,
    //   duration: const Duration(milliseconds: 250),
    //   builder: (context) => const Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Gap.H(200),
    //       Text('Hello'),
    //       TextField(),
    //       Gap.H(200),
    //     ],
    //   ),
    // );

    // await CategoriesBottomSheet.showBottomSheet<void>(context);
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
    await const SettingsView().showAsModalBottomSheet<void>(context);
  }

  ///
  /// Show BottomSheet Function
  ///
  Future<void> _showBottomSheet(BuildContext context, {required Widget child}) async {
    await AppDialogs.instance.showModalBottomSheetDialog<void>(
      context,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: context.height),
      elevation: 0,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      child: child,
    );
  }
}
