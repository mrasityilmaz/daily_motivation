part of '../settings_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_SettingsBottomSheetViewModel> {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, _SettingsBottomSheetViewModel viewModel) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverFillRemaining(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.5)),
                    ),
                    SizedBox(
                      height: context.normalValue,
                    ),
                    _SettingsRowWidget(
                      icon: CupertinoIcons.heart_fill,
                      iconColor: Colors.red.shade600,
                      title: 'Favoriler',
                      onPressed: () async {
                        await locator<AppRouter>().push(const FavoritesViewRoute());
                      },
                    ),
                    _SettingsRowWidget(
                      icon: CupertinoIcons.heart_fill,
                      iconColor: Colors.red.shade600,
                      title: 'Favoriler',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverSafeArea(
          minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
          sliver: const SliverToBoxAdapter(
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}

@immutable
final class _SettingsRowWidget extends StatelessWidget {
  const _SettingsRowWidget({required this.icon, required this.title, required this.onPressed, this.iconColor});

  final IconData icon;
  final Color? iconColor;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowBottom,
      child: AdvancedButtonWidget(
        backgroundColor: context.colors.background,
        padding: context.paddingLowVertical * 1.2 + context.paddingLowHorizontal,
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            SizedBox(
              width: context.screenPadding.left,
            ),
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: context.colors.onBackground.withOpacity(.3),
            ),
          ],
        ),
      ),
    );
  }
}
