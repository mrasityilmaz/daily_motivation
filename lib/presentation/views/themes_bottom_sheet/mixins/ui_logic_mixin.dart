part of '../themes_bottom_sheet.dart';

mixin _UILogicMixin on Widget {
  ///
  /// Button Action
  ///

  Future<void> onTapThemeBox(
    BuildContext context, {
    required bool isLocked,
    required Future<void> Function() onChanged,
  }) async {
    try {
      late final Future<bool?> future = ProgressOverlayDialog.instance.showProgressOverlay<bool>(
        context,
        asyncProcess: () async {
          await onChanged.call();

          return true;
        },
      ).then((result) async {
        if (result == true) {
          await locator<AppRouter>().maybePop();
        }

        return true;
      });

      ///
      ///
      ///

      if (isLocked == false) {
        await future;
      } else {
        await AppDialogs.instance.showDialog<bool?>(
          context,
          child: ShowOrPayDialogBody(
            icon: Icon(
              Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
              size: kMinInteractiveDimension * 1.2,
              color: context.colors.primary,
            ),
            firstButtonText: 'Reklam İzle',
            secondButtonText: 'Premium Ol',
            firstButtonOnPressed: () async {
              await locator<AppRouter>().maybePop().whenComplete(() async {
                await future;
              });
            },
            title: 'Seçili Temanın Kilidini Aç',
          ),
        );
      }
    } catch (e, s) {
      await locator<AppRouter>().maybePop();
      ProgressOverlayDialog.instance.closeOverlay();
      LoggerService.instance.catchLog(e, s);
    }
  }
}
