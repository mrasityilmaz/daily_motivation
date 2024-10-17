part of '../home_view.dart';

@immutable
final class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingConstants.lowHorizontal(),
      child: Row(
        children: [
          if (locator<UserService>().isLoggedIn) ...[
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: locator<UserService>().user!.uid));
              },
              child: Text(
                locator<UserService>().user!.uid.substring(0, 8),
              ),
            ),
          ],
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
                    // // await locator<AppWorkManager>().schedulePeriodicTask();
                    // await locator<NotificationService>().showNotification(
                    //   message: 'Hello from the buttons! - ${DateTime.now()}',
                    // );
                  } catch (e, s) {
                    LoggerService.catchLog(e, s);
                  }
                },
                icon: Image.asset(
                  Assets.crow_front_premium_png,
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
