part of '../settings_bottom_sheet.dart';

@immutable
final class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: context.textTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.5)),
        ),
        SizedBox(
          height: context.normalValue,
        ),
        _SettingsRowWidget(
          icon: true ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          iconColor: true ? context.colors.onSurface.withOpacity(.6) : Colors.amber.shade300,
          title: 'Dark Mode',
          onPressed: _toggleTheme,
          trailing: ConstrainedBox(
            constraints: BoxConstraints.tight(const Size(50, 20)),
            child: Switch.adaptive(
              splashRadius: 12,
              value: true,
              applyCupertinoTheme: true,
              onChanged: (a) => _toggleTheme(),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: locator<NotificationService>().isNotificationPermissionGranted,
          builder: (context, value, child) {
            return _SettingsRowWidget(
              icon: Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
              title: 'Notifications',
              onPressed: () async {
                if (!value) {
                  await locator<NotificationService>()
                      .requestNotificationPermission(openAppSettingsWhenPermanentlyDenied: true);
                } else {
                  await AppDialogs.instance.showBasicFlushBar(
                    context,
                    message: 'To turn off notifications, go to the app settings.',
                    duration: context.normalDuration * 2,
                    onPressed: openAppSettings,
                  );
                }
              },
              trailing: ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(50, 20)),
                child: Switch.adaptive(
                  splashRadius: 12,
                  value: locator<NotificationService>().isNotificationPermissionGranted.value,
                  applyCupertinoTheme: true,
                  onChanged: (permissionValue) async {
                    if (permissionValue) {
                      await locator<NotificationService>()
                          .requestNotificationPermission(openAppSettingsWhenPermanentlyDenied: true);
                    } else {
                      await AppDialogs.instance.showBasicFlushBar(
                        context,
                        message: 'To turn off notifications, go to the app settings.',
                        duration: context.normalDuration * 2,
                        onPressed: openAppSettings,
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
        _SettingsRowWidget(
          icon: Platform.isAndroid ? Icons.feedback_outlined : CupertinoIcons.text_bubble,
          title: 'Give Feedback',
          onPressed: () async {},
        ),
        _SettingsRowWidget(
          icon: Icons.adaptive.share_outlined,
          iconPadding: const PaddingConstants.lowVertical() * .25,
          title: 'Share App',
          onPressed: () async {},
        ),
        _SettingsRowWidget(
          icon: Icons.star_outline_outlined,
          iconPadding: const PaddingConstants.lowVertical() * .25,
          iconColor: Colors.amber.shade400,
          title: 'Rate Us',
          onPressed: () async {},
        ),
      ],
    );
  }

  void _toggleTheme() {}

  Future<void> _pushRoute(auto_route.PageRouteInfo<dynamic> route) async {
    await locator<AppRouter>().push(route);
  }
}
