part of '../settings_view.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_SettingsBottomSheetViewModel> {
  const _BodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, _SettingsBottomSheetViewModel viewModel) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const PaddingConstants.screenPaddingHorizontal(),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
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
        ),
        const SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }
}
