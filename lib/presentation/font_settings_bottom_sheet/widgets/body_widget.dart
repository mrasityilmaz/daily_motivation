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
      (
        icon: Platform.isIOS ? CupertinoIcons.text_aligncenter : Icons.format_align_center_rounded,
        text: 'Align',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 1) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(1);
        },
        child: const __AlignChild()
      ),
      (
        icon: Icons.text_increase_rounded,
        text: 'Size',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 2) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(2);
        },
        child: const __TextSizeChild()
      ),
      (
        icon: Icons.format_bold_rounded,
        text: 'Type',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 3) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(3);
        },
        child: const __FontWeightChild()
      ),
      (
        icon: CupertinoIcons.color_filter,
        text: 'Color',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 4) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(4);
        },
        child: const __TextColorChild()
      ),
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
              child: RawGestureDetector(
                gestures: {
                  VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
                    VerticalDragGestureRecognizer.new,
                    (VerticalDragGestureRecognizer instance) {
                      instance.onUpdate = (details) {
                        final screenSize = (context.mediaQuery.removeViewPadding().size.height - (context.adaptiveScreenPaddingBottom.bottom * 2)) * .85;
                        final double offset = viewModel.textOffset + (details.delta.dy / screenSize * 10);
                        final RenderBox? renderBox = viewModel.autoSizeTextKey.currentContext?.findRenderObject() as RenderBox?;
                        final double? childSize = renderBox?.size.height;
                        final double maxOffsetTreshold = (context.height - screenSize) / 2;
                        print('Result : ${renderBox?.localToGlobal(Offset.zero).dy ?? 0}');

                        // print('Offset : $offset');
                        // print('Height : $childSize');
                        // print('ScreenHeight : $screenSize');
                        // if ((renderBox?.localToGlobal(Offset.zero).dy ?? 0) >= maxOffsetTresholdk) {
                        //   viewModel.setTextOffset(offset);
                        // }
                      };
                    },
                  ),
                },
                child: Padding(
                  padding: context.screenPaddingHorizontal,
                  child: FractionallySizedBox(
                    heightFactor: .85,
                    alignment: Alignment(0, viewModel.textOffset),
                    child: UnconstrainedBox(
                      constrainedAxis: Axis.horizontal,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: viewModel.textAlign.toAlignment,
                            child: AutoSizeText(
                              key: viewModel.autoSizeTextKey,
                              viewModel.quoteModel.quote,
                              style: viewModel.quoteTextStyle,
                              minFontSize: viewModel.currentThemeConfiguration.minFontSize,
                              maxLines: 18,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              stepGranularity: .5,
                              textAlign: viewModel.textAlign,
                            ),
                          ),
                          SizedBox(height: context.normalValue),
                          Align(
                            alignment: viewModel.textAlign.toAlignment,
                            child: AutoSizeText(
                              '-${viewModel.quoteModel.author}',
                              style: viewModel.authorTextStyle,
                              maxLines: 1,
                              minFontSize: viewModel.currentThemeConfiguration.minFontSize,
                              textAlign: viewModel.textAlign,
                            ),
                          ),
                        ],
                      ),
                    ),
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
          viewModel.changeFont(
            fontName: p0.fontFamily,
          );
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
    return DefaultTabController(
      length: viewModel.textAlignList.length,
      initialIndex: viewModel.textAlignList.indexOf(viewModel.textAlign),
      child: Padding(
        padding: context.paddingLow,
        child: TabBar(
          onTap: (value) {
            viewModel.setTextAlign(viewModel.textAlignList[value]);
          },
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: context.radius12,
              side: BorderSide(color: context.colors.background.withOpacity(.1)),
            ),
            color: context.colors.background.withOpacity(.5),
          ),
          padding: EdgeInsets.zero,
          dividerHeight: 0,
          tabAlignment: TabAlignment.fill,
          tabs: viewModel.textAlignList.map((e) {
            return Tab(
              icon: Icon(e.icon),
              text: e.name,
              iconMargin: EdgeInsets.zero,
            );
          }).toList(),
        ),
      ),
    );
  }
}

@immutable
final class __TextSizeChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __TextSizeChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: context.paddingLow + context.paddingLowBottom,
      child: Row(
        children: [
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                valueIndicatorColor: Colors.white,
                valueIndicatorTextStyle: const TextStyle(color: Colors.black),
                thumbShape: CustomSliderThumbShape(
                  borderColor: context.colors.onBackground.withOpacity(.2),
                  textColor: context.textTheme.labelSmall!.color,
                  text: viewModel.quoteFontSize.toStringAsFixed(1),
                ),
              ),
              child: Slider(
                max: 62,
                min: 9,
                value: viewModel.quoteFontSize,
                allowedInteraction: SliderInteraction.slideOnly,
                onChangeEnd: (value) {},
                label: viewModel.quoteFontSize.toStringAsFixed(1),
                onChanged: (va) async {
                  viewModel.changeFontSize(fontSize: va);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
final class __FontWeightChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __FontWeightChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return DefaultTabController(
      length: 4,
      initialIndex: viewModel.selectedFontTypeIndex,
      child: Padding(
        padding: context.paddingLow,
        child: TabBar(
          onTap: (value) {
            viewModel.fontTypeButtonList[value].onChange.call();
          },
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: context.radius12,
              side: BorderSide(color: context.colors.background.withOpacity(.1)),
            ),
            color: context.colors.background.withOpacity(.5),
          ),
          padding: EdgeInsets.zero,
          dividerHeight: 0,
          tabAlignment: TabAlignment.fill,
          tabs: viewModel.fontTypeButtonList.map((e) => Tab(icon: Icon(e.icon), iconMargin: EdgeInsets.zero, child: Text(e.text))).toList(),
        ),
      ),
    );
  }
}

@immutable
final class __TextColorChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __TextColorChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: kMinInteractiveDimension + context.paddingLowVertical.vertical,
      ),
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList.builder(
            itemCount: viewModel.textColorList.length,
            itemBuilder: (context, index) {
              final bool isSelected = viewModel.textColorList[index] == viewModel.quoteTextStyle.color;
              return Padding(
                padding: context.paddingLowLeft + context.paddingLowVertical + ((index == viewModel.textColorList.length - 1) ? context.paddingLowRight : EdgeInsets.zero),
                child: AdvancedButtonWidget(
                  backgroundColor: viewModel.textColorList[index],
                  shape: RoundedRectangleBorder(
                    borderRadius: context.radius12,
                    side: isSelected ? BorderSide(color: context.colors.primary, width: 2) : BorderSide.none,
                  ),
                  child: const SizedBox(),
                  onPressed: () {
                    viewModel.changeTextColor(color: viewModel.textColorList[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
