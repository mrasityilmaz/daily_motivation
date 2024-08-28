part of '../settings_bottom_sheet.dart';

@immutable
final class _PreferencesAndFavoritesSection extends StatelessWidget {
  const _PreferencesAndFavoritesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences & Favorites',
          style: context.textTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.5)),
        ),
        SizedBox(
          height: context.normalValue,
        ),
        _SettingsRowWidget(
          icon: CupertinoIcons.heart_fill,
          iconColor: Colors.red.shade600,
          title: 'Favoriler',
          onPressed: () async => _pushRoute(const FavoritesViewRoute()),
        ),
        _SettingsRowWidget(
          icon: Platform.isAndroid ? Icons.format_quote_rounded : CupertinoIcons.quote_bubble,
          title: 'Alıntılarım',
          onPressed: () async => _pushRoute(const MyQuotesViewRoute()),
        ),
        _SettingsRowWidget(
          icon: Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
          title: 'Hatırlatıcılar',
          onPressed: () async => _pushRoute(const RemindersViewRoute()),
        ),
        _SettingsRowWidget(
          icon: Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
          title: 'Alıntı Bildirimleri',
          onPressed: () async => _pushRoute(const QuoteNotificationsViewRoute()),
        ),
      ],
    );
  }

  Future<void> _pushRoute(auto_route.PageRouteInfo<dynamic> route) async {
    await locator<AppRouter>().push(route);
  }
}
