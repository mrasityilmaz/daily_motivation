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
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: context.paddingLowTop + context.paddingNormalBottom * 2,
                  child: AdvancedButtonWidget.text(
                    text: 'Be Premium',
                    onPressed: () {},
                    expand: true,
                    textStyle: context.textTheme.titleMedium?.copyWith(color: context.colors.onPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferences & Favorites',
                      style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.5)),
                    ),
                    SizedBox(
                      height: context.normalValue,
                    ),
                    _SettingsRowWidget(
                      icon: CupertinoIcons.heart_fill,
                      iconColor: Colors.red.shade600,
                      title: 'Favoriler',
                      onPressed: () async => viewModel.pushRoute(const FavoritesViewRoute()),
                    ),
                    _SettingsRowWidget(
                      icon: Platform.isAndroid ? Icons.format_quote_rounded : CupertinoIcons.quote_bubble,
                      title: 'Alıntılarım',
                      onPressed: () async => viewModel.pushRoute(const MyQuotesViewRoute()),
                    ),
                    _SettingsRowWidget(
                      icon: Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                      title: 'Hatırlatıcılar',
                      onPressed: () async => viewModel.pushRoute(const RemindersViewRoute()),
                    ),
                    _SettingsRowWidget(
                      icon: Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                      iconColor: context.colors.primary,
                      title: 'Alıntı Bildirimleri',
                      onPressed: () async => viewModel.pushRoute(const QuoteNotificationsViewRoute()),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.normalValue * 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.5)),
                    ),
                    SizedBox(
                      height: context.normalValue,
                    ),
                    _SettingsRowWidget(
                      icon: locator<ThemeService>().isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                      iconColor: locator<ThemeService>().isDarkMode ? context.colors.onSurface.withOpacity(.6) : Colors.amber.shade300,
                      title: 'Dark Mode',
                      onPressed: viewModel.toggleTheme,
                      trailing: ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(50, 20)),
                        child: Switch.adaptive(
                          splashRadius: 12,
                          value: locator<ThemeService>().isDarkMode,
                          applyCupertinoTheme: true,
                          onChanged: (a) => viewModel.toggleTheme(),
                        ),
                      ),
                    ),
                    _SettingsRowWidget(
                      icon: Platform.isAndroid ? Icons.feedback_outlined : CupertinoIcons.text_bubble,
                      iconColor: context.colors.primary,
                      title: 'Give Feedback',
                      onPressed: () async {},
                    ),
                    _SettingsRowWidget(
                      icon: Icons.adaptive.share_outlined,
                      iconPadding: context.paddingLowVertical * .25,
                      iconColor: context.colors.primary,
                      title: 'Share App',
                      onPressed: () async {},
                    ),
                    _SettingsRowWidget(
                      icon: Icons.star_outline_outlined,
                      iconPadding: context.paddingLowVertical * .25,
                      iconColor: Colors.amber.shade400,
                      title: 'Rate Us',
                      onPressed: () async {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }
}
