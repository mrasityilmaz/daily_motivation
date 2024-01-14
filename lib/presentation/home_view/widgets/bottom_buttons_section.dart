part of '../home_view.dart';

@immutable
final class _BottomButtonsSection extends ViewModelWidget<HomeViewModel> {
  const _BottomButtonsSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: context.radius12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AdvancedButtonWidget.iconText(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
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
                    text: viewModel.selectedCategory?.name ?? '',
                    textColor: Colors.white,
                    icon: const Icon(
                      CupertinoIcons.square_grid_2x2,
                      color: Colors.white,
                      size: 32,
                    ),
                    textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: context.radius12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AdvancedButtonWidget.icon(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    onPressed: () async {
                      await AppDialogs.instance.showModalBottomSheetDialog<void>(
                        context,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height * .9),
                        elevation: 0,
                        useRootNavigator: true,
                        isScrollControlled: true,

                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.radius16.resolve(TextDirection.ltr).topLeft)),
                        child: const ThemesBottomSheet(),
                      );
                    },
                    icon: Icon(
                      Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.lowValue,
              ),
              ClipRRect(
                borderRadius: context.radius12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AdvancedButtonWidget.icon(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    onPressed: () async {
                      await AppDialogs.instance.showModalBottomSheetDialog<void>(
                        context,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height, minHeight: context.height),
                        elevation: 0,
                        useRootNavigator: true,
                        isScrollControlled: true,

                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.radius16.resolve(TextDirection.ltr).topLeft)),
                        child: FontSettingsBottomSheet(
                          quoteModel: viewModel.currentQuote,
                        ),
                      );
                    },
                    icon: Icon(
                      Platform.isAndroid ? Icons.text_fields_rounded : CupertinoIcons.textformat_size,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.lowValue,
              ),
              ClipRRect(
                borderRadius: context.radius12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AdvancedButtonWidget.icon(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    onPressed: () {
                      locator<ThemeService>().toggleDarkLightTheme();
                    },
                    icon: Icon(
                      Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
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
