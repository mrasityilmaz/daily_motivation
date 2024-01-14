part of '../font_settings_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    final List<({IconData icon, String text, VoidCallback onPressed, Widget child})> buttonList = [
      (
        icon: Platform.isIOS ? CupertinoIcons.textformat_size : Icons.text_fields,
        text: 'Font',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 0) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(0);
        },
        child: const __FontChild(),
      ),
      (icon: Platform.isIOS ? CupertinoIcons.text_aligncenter : Icons.format_align_center_rounded, text: 'Align', onPressed: () {}, child: const SizedBox()),
      (icon: Icons.text_increase_rounded, text: 'Size', onPressed: () {}, child: const SizedBox()),
      (icon: Icons.format_bold_rounded, text: 'Weight', onPressed: () {}, child: const SizedBox()),
      (icon: CupertinoIcons.color_filter, text: 'Color', onPressed: () {}, child: const SizedBox()),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: context.appColors.surfaceColor,
        ),
        child: SafeArea(
          minimum: context.adaptiveScreenPaddingBottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 250),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (viewModel.selectedBottomButtonIndex != null) ...[
                      buttonList[viewModel.selectedBottomButtonIndex!].child,
                    ],
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: kMinInteractiveDimension + context.paddingLowVertical.vertical,
                ),
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList.builder(
                      itemCount: buttonList.length,
                      itemBuilder: (context, index) {
                        final ({IconData icon, String text, VoidCallback onPressed, Widget child}) buttonData = buttonList[index];
                        return Padding(
                          padding: context.paddingLowLeft + context.paddingLowVertical + ((index == buttonList.length - 1) ? context.paddingLowRight : EdgeInsets.zero),
                          child: AdvancedButtonWidget.iconText(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: context.radius12,
                              side: BorderSide(color: context.colors.background.withOpacity(.1)),
                            ),
                            icon: Icon(
                              buttonData.icon,
                              color: Colors.white,
                            ),
                            text: buttonData.text,
                            onPressed: buttonData.onPressed,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(viewModel.currentThemeConfiguration.backgroundPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: context.screenPaddingHorizontal,
                child: FractionallySizedBox(
                  heightFactor: .85,
                  alignment: const Alignment(0, -.6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        viewModel.quoteModel.quote,
                        style: GoogleFonts.getFont(
                          fontSize: viewModel.currentThemeConfiguration.maxFontSize / 1.2,
                          viewModel.currentThemeConfiguration.fontName,
                          color: viewModel.currentThemeConfiguration.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        maxFontSize: viewModel.currentThemeConfiguration.maxFontSize,
                        minFontSize: viewModel.currentThemeConfiguration.minFontSize,
                        maxLines: 18,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        stepGranularity: .5,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: context.normalValue),
                      AutoSizeText(
                        viewModel.quoteModel.author,
                        style: GoogleFonts.getFont(
                          viewModel.currentThemeConfiguration.fontName,
                          color: viewModel.currentThemeConfiguration.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                        ),
                        maxFontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                        maxLines: 1,
                        minFontSize: context.textTheme.titleSmall?.fontSize ?? 14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SafeArea(
            //   minimum: context.adaptiveScreenPaddingBottom + context.screenPadding,
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: CustomDropdown<DefaultFontsEnum>(
            //       decoration: CustomDropdownDecoration(
            //         closedFillColor: context.colors.surface.withOpacity(.5),
            //       ),
            //       overlayHeight: context.height * .6,
            //       items: viewModel.allDefaultFontList.map((e) => e).toList(),
            //       listItemBuilder: (context, item, isSelected, onItemSelect) {
            //         return Row(
            //           children: [
            //             Expanded(
            //               child: FractionallySizedBox(
            //                 widthFactor: .9,
            //                 alignment: Alignment.centerLeft,
            //                 child: Text(
            //                   viewModel.quoteModel.quote,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: GoogleFonts.getFont(
            //                     item.fontFamily,
            //                     color: Colors.black,
            //                     fontWeight: FontWeight.w400,
            //                     fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       },
            //       onChanged: (p0) async {
            //         await viewModel.updateThemeConfiguration(model: viewModel.currentThemeConfiguration.copyWith(fontName: p0.fontFamily));
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

@immutable
final class __FontChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __FontChild({super.key});

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: context.paddingNormalVertical + context.paddingLowHorizontal,
      child: CustomDropdown<DefaultFontsEnum>(
        decoration: CustomDropdownDecoration(
          closedFillColor: context.colors.onBackground.withOpacity(.5),
        ),
        overlayHeight: context.height * .6,
        items: viewModel.allDefaultFontList.map((e) => e).toList(),
        initialItem: DefaultFontsEnum.values.firstWhereOrNull((element) => element.fontFamily == viewModel.currentThemeConfiguration.fontName),
        listItemBuilder: (context, item, isSelected, onItemSelect) {
          return Row(
            children: [
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: .9,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    viewModel.quoteModel.quote,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.getFont(
                      item.fontFamily,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onChanged: (p0) async {
          await viewModel.updateThemeConfiguration(model: viewModel.currentThemeConfiguration.copyWith(fontName: p0.fontFamily));
        },
      ),
    );
  }
}

@immutable
final class __AlignChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __AlignChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: context.paddingNormalVertical + context.paddingLowHorizontal,
      child: CustomDropdown<DefaultFontsEnum>(
        decoration: CustomDropdownDecoration(
          closedFillColor: context.colors.onBackground.withOpacity(.5),
        ),
        overlayHeight: context.height * .6,
        items: viewModel.allDefaultFontList.map((e) => e).toList(),
        listItemBuilder: (context, item, isSelected, onItemSelect) {
          return Row(
            children: [
              Expanded(
                child: FractionallySizedBox(
                  widthFactor: .9,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    viewModel.quoteModel.quote,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.getFont(
                      item.fontFamily,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onChanged: (p0) async {
          await viewModel.updateThemeConfiguration(model: viewModel.currentThemeConfiguration.copyWith(fontName: p0.fontFamily));
        },
      ),
    );
  }
}
