part of '../home_view.dart';

@immutable
final class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Row(
        children: [
          const Spacer(),
          ClipRRect(
            borderRadius: context.radius12,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              child: AdvancedButtonWidget.icon(
                backgroundColor: context.colors.scrim.withOpacity(.3),
                onPressed: () async {
                  // locator<ThemeService>().toggleDarkLightTheme();
                  try {
                    await locator<NotificationService>()
                        .flutterLocalNotificationsPlugin
                        .show(1, 'Test', 'Hello', const NotificationDetails(iOS: DarwinNotificationDetails(interruptionLevel: InterruptionLevel.critical)), payload: 'Payload Test');
                  } catch (e, s) {
                    LoggerService.instance.catchLog(e, s);
                  }
                },
                icon: Image.asset(Assets.crow_front_premium_png, width: 32, height: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
