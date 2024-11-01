part of '../settings_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<SettingsBottomSheetViewModel> {
  const _BodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, SettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: PaddingConstants.adaptiveScreenPadding(context),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const RangeMaintainingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UpgradePremiumButton(
              onPressed: () {},
            ),
            const Gap.highHeight(),
            const _PreferencesAndFavoritesSection(),
            const Gap.highHeight(),
            const _SettingsSection(),
            const Gap.highHeight() * 2,
            Text(
              LocaleKeys.app_version.tr(
                namedArgs: {
                  LocaleKeys.app_version.split('.').last: '1.0.0',
                },
              ),
              style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
            ),
          ],
        ),
      ),
    );
  }
}
