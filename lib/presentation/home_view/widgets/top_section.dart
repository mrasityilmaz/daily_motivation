part of '../home_view.dart';

@immutable
final class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.screenPaddingHorizontal,
      child: Row(
        children: [
          const Spacer(),
          AdvancedButtonWidget.icon(
            backgroundColor: context.colors.background.withOpacity(.1),
            onPressed: () {
              locator<ThemeService>().toggleDarkLightTheme();
            },
            icon: Image.asset(Assets.crow_front_premium_png, width: 32, height: 32),
          ),
        ],
      ),
    );
  }
}
