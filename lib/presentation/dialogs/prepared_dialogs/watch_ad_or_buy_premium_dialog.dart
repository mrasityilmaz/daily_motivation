part of '../dialog_helper.dart';

typedef WatchAdOrBuyPremiumDialogParams = ({
  IconData icon,
  String? title,
  String? watchAdText,
  AsyncCallback watchAdPressed,
});
base mixin _ShowAdOrBuyPremiumDialogHelper {
  static Future<void> showWatchAdOrBuyPremiumDialog(
    BuildContext context, {
    required WatchAdOrBuyPremiumDialogParams params,
  }) async =>
      DialogHelper.showDialog<void>(
        context,
        child: ShowOrPayDialogBody(
          icon: Icon(
            params.icon,
            size: kMinInteractiveDimension * 1.2,
            color: context.colors.primary,
          ),
          watchAdText: params.watchAdText ?? LocaleKeys.watch_ad.tr(),
          watchAdPressed: () async {
            await locator<AppRouter>().maybePop().whenComplete(() async {
              await params.watchAdPressed.call();
            });
          },
          title: params.title ?? LocaleKeys.watch_ad_to_unlock.tr(),
        ),
      );
}
