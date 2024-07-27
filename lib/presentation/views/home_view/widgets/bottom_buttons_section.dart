part of '../home_view.dart';

@immutable
final class _BottomButtonsSection extends VSelectorViewModelWidget<HomeViewModel, Categories> {
  const _BottomButtonsSection() : super();

  @override
  Widget build(BuildContext context, Categories category, HomeViewModel viewModel) {
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
                    onPressed: () async => viewModel.showCategoriesBottomSheet(context),
                    text: category.name,
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
                    onPressed: () async => viewModel.showThemesBottomSheet(context),
                    icon: Icon(
                      Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: context.lowValue,
              // ),
              // ClipRRect(
              //   borderRadius: context.radius12,
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              //     child: AdvancedButtonWidget.icon(
              //       backgroundColor: context.colors.scrim.withOpacity(.3),
              //       onPressed: () async {
              //         // print(MatrixUtils.transformRect(
              //         //     ?.getTransformTo((viewModel.textAreaKey.currentContext?.findRenderObject() as RenderBox?)?.parent),
              //         //     Offset.zero & (viewModel.textAreaKey.currentContext?.findRenderObject() as RenderBox?)?.size));
              //         await AppDialogs.instance.showModalBottomSheetDialog<void>(
              //           context,
              //           backgroundColor: Colors.transparent,
              //           constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height, minHeight: context.mediaQuery.size.height),
              //           elevation: 0,
              //           useRootNavigator: true,
              //           enableDrag: false,
              //           isScrollControlled: true,

              //           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.radius16.resolve(TextDirection.ltr).topLeft)),

              //           child: FontSettingsBottomSheet(
              //             quoteModel: viewModel.currentQuote,
              //           ),
              //         );
              //       },
              //       icon: Icon(
              //         Platform.isAndroid ? Icons.text_fields_rounded : CupertinoIcons.textformat_size,
              //         color: Colors.white,
              //         size: 32,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: context.lowValue,
              ),
              ClipRRect(
                borderRadius: context.radius12,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                  child: AdvancedButtonWidget.icon(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    onPressed: () async => viewModel.showSettingsBottomSheet(context),
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

  @override
  Categories selector(HomeViewModel viewModel) {
    return viewModel.selectedCategory ?? Categories.general;
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
