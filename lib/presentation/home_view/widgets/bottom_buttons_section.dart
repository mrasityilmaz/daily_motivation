part of '../home_view.dart';

@immutable
final class _BottomButtonsSection extends StatelessWidget {
  const _BottomButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Row(
            children: [
              AdvancedButtonWidget.iconText(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () async {
                  await AppDialogs.instance.showModalBottomSheetDialog<void>(
                    context,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height * .9),
                    elevation: 0,
                    useRootNavigator: true,
                    isScrollControlled: true,

                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.radius16.resolve(TextDirection.ltr).topLeft)),
                    child: const CategoriesBottomSheet(),
                  );
                },
                text: 'General',
                icon: const Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: Colors.white,
                  size: 32,
                ),
                textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              AdvancedButtonWidget.icon(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () {
                  locator<ThemeService>().toggleDarkLightTheme();
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
                  size: 32,
                ),
              ),
              SizedBox(
                width: context.lowValue,
              ),
              AdvancedButtonWidget.icon(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () {
                  locator<ThemeService>().toggleDarkLightTheme();
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        const _AdBanner(),
      ],
    );
  }
}

@immutable
final class _AdBanner extends StatelessWidget {
  const _AdBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: kBottomNavigationBarHeight,
    );
  }
}
