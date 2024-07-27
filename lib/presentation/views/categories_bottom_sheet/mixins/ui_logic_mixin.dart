part of '../categories_bottom_sheet_viewmodel.dart';

mixin _UILogicMixin on ChangeNotifier {
  ///
  /// Button Action
  ///

  Future<void> _onTapToChangeCategory(BuildContext context, {required Categories category, required Future<void> Function() onChangeFunction}) async {
    try {
      late final Future<bool?> future = ProgressOverlayDialog.instance.showProgressOverlay<bool>(
        context,
        asyncProcess: () async {
          await onChangeFunction.call();

          return true;
        },
      ).then((result) async {
        if (result == true) {
          await locator<AppRouter>().maybePop();
        }
        return true;
      });

      ///
      /// If the category is a premium
      ///
      if (category.isPremium) {
        await AppDialogs.instance.showDialog<void>(
          context,
          child: ShowOrPayDialogBody(
            icon: Icon(
              Platform.isAndroid ? Icons.grid_view_rounded : CupertinoIcons.square_grid_2x2,
              size: kMinInteractiveDimension * 1.2,
              color: context.colors.primary,
            ),
            firstButtonText: 'Premium Ol',
            firstButtonOnPressed: () async {
              await locator<AppRouter>().maybePop().whenComplete(() async {
                await future;
              });
            },
            title: 'Seçili Kategorinin Kilidini Aç',
          ),
        );
      }

      ///
      /// Other
      ///
      else {
        await future;
      }

      ///
      ///
      ///
    } catch (e, s) {
      await locator<AppRouter>().maybePop();
      ProgressOverlayDialog.instance.closeOverlay();
      LoggerService.instance.catchLog(e, s);
    }
  }
}
