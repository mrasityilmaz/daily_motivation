part of '../settings_view.dart';

@immutable
final class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.settings_settings.tr(),
          style: context.textTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.5)),
        ),
        const Gap.normalHeight(),
        _SettingsRowWidget(
          icon: true ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          iconColor: true ? context.colors.onSurface.withOpacity(.6) : Colors.amber.shade300,
          title: LocaleKeys.settings_dark_mode.tr(),
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
              title: LocaleKeys.settings_notifications.tr(),
              onPressed: () async => _switchNotifications(context, value),
              trailing: ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(50, 20)),
                child: Switch.adaptive(
                  splashRadius: 12,
                  value: locator<NotificationService>().isNotificationPermissionGranted.value,
                  applyCupertinoTheme: true,
                  onChanged: (perm) async => _switchNotifications(context, value),
                ),
              ),
            );
          },
        ),
        _SettingsRowWidget(
          icon: Platform.isAndroid ? Icons.feedback_outlined : CupertinoIcons.text_bubble,
          title: LocaleKeys.settings_give_feedback.tr(),
          onPressed: () async {
            //TODO Unimplemented
          },
        ),
        _SettingsRowWidget(
          icon: Icons.adaptive.share_outlined,
          iconPadding: const PaddingConstants.lowVertical() * .25,
          title: LocaleKeys.settings_share_app.tr(),
          onPressed: () async {
            //TODO Unimplemented
          },
        ),
        _SettingsRowWidget(
          icon: Icons.star_outline_outlined,
          iconPadding: const PaddingConstants.lowVertical() * .25,
          iconColor: Colors.amber.shade400,
          title: LocaleKeys.settings_rate_us.tr(),
          onPressed: () async {
            //TODO Unimplemented
          },
        ),
      ],
    );
  }

  void _toggleTheme() {}

  Future<void> _pushRoute(auto_route.PageRouteInfo<dynamic> route) async {
    await locator<AppRouter>().push(route);
  }

  Future<void> _switchNotifications(BuildContext context, bool value) async {
    try {
      if (value) {
        await locator<NotificationService>().requestNotificationPermission(openAppSettingsWhenPermanentlyDenied: true);
      } else {
        await AppDialogs.instance.showBasicFlushBar(
          context,
          message: LocaleKeys.warning_turn_off_notifications.tr(),
          duration: context.normalDuration * 2,
          onPressed: openAppSettings,
        );
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s, 'SettingsSection._switchNotifications');
    }
  }
}
