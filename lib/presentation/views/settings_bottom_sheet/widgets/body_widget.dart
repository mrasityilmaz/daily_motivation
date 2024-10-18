part of '../settings_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_SettingsBottomSheetViewModel> {
  const _BodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, _SettingsBottomSheetViewModel viewModel) {
    return CustomScrollView(
      controller: PrimaryScrollController.of(context),
      slivers: [
        SliverPadding(
          padding: const PaddingConstants.screenPadding(),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: const PaddingConstants.lowTop() + const PaddingConstants.normalBottom() * 2,
                  child: AdvancedButtonWidget.text(
                    text: 'Be Premium',
                    onPressed: () {},
                    expand: true,
                    textStyle: context.textTheme.titleMedium
                        ?.copyWith(color: context.colors.onPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
                const _PreferencesAndFavoritesSection(),
                SizedBox(
                  height: context.normalValue * 2,
                ),
                const _SettingsSection(),
              ],
            ),
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }
}
