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
        icon: Icons.format_bold_rounded,
        text: 'Type',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 2) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(2);
        },
        child: const __FontWeightChild()
      ),
      (
        icon: CupertinoIcons.color_filter,
        text: 'Color',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 3) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(3);
        },
        child: const __TextColorChild()
      ),
      (
        icon: CupertinoIcons.move,
        text: 'Move',
        onPressed: () {
          if (viewModel.selectedBottomButtonIndex == 4) {
            viewModel.setSelectedBottomButtonIndex(null);
            return;
          }
          viewModel.setSelectedBottomButtonIndex(4);
        },
        child: const __MoveAndResizeSizeChild()
      ),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: context.appColors.surfaceColor,
        ),
        child: SafeArea(
          minimum: PaddingConstants.adaptiveScreenPaddingBottom(context),
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
                  height: kMinInteractiveDimension + const PaddingConstants.lowVertical().vertical,
                ),
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList.builder(
                      itemCount: buttonList.length,
                      itemBuilder: (context, index) {
                        final ({IconData icon, String text, VoidCallback onPressed, Widget child}) buttonData =
                            buttonList[index];
                        return Padding(
                          padding: const PaddingConstants.lowLeft() +
                              const PaddingConstants.lowVertical() +
                              ((index == buttonList.length - 1) ? const PaddingConstants.lowRight() : EdgeInsets.zero),
                          child: CustomButton.outlined(
                            backgroundColor: Colors.transparent,
                            onPressed: buttonData.onPressed,
                            child: Row(
                              children: [
                                Icon(
                                  buttonData.icon,
                                  color: Colors.white,
                                ),
                                const Gap.tinyWidth(),
                                Text(
                                  buttonData.text,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
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
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(viewModel.currentThemeConfiguration.backgroundPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            if (viewModel.textRect != null) ...[
              const _ResizableContainer(),
            ] else ...[
              const _QuoteAndAuthorWidget(),
            ],
          ],
        ),
      ),
    );
  }
}

@immutable
final class _QuoteAndAuthorWidget extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const _QuoteAndAuthorWidget();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    // final screenSize = (context.mediaQuery.removeViewPadding().size.height - (PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom).bottom * 2)) * .85;
    // final RenderBox? renderBox = viewModel.autoSizeTextKey.currentContext?.findRenderObject() as RenderBox?;
    // final Rect widgetRect = (renderBox?.localToGlobal(Offset.zero) ?? Offset.zero) & (renderBox?.size ?? Size.zero);
    // final Rect safeArea = Rect.fromPoints(
    //   Offset(const PaddingConstants.screenPaddingHorizontal().left, screenSize * .15),
    //   Offset(context.width - const PaddingConstants.screenPaddingHorizontal().right, screenSize - ((screenSize * .15))),
    // );

    if (viewModel.textRect != null) {
      return Center(
        child: ColoredBox(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  text: viewModel.quoteModel.quote,
                  children: [
                    TextSpan(
                      text: '\n\n${viewModel.quoteModel.author}',
                      style: GoogleFonts.getFont(
                        viewModel.currentThemeConfiguration.fontName,
                        color: viewModel.currentThemeConfiguration.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                      ),
                    ),
                  ],
                ),
                style: GoogleFonts.getFont(
                  fontSize: viewModel.currentThemeConfiguration.maxFontSize / 1.2,
                  viewModel.currentThemeConfiguration.fontName,
                  color: viewModel.currentThemeConfiguration.textColor,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 18,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                key: viewModel.autoSizeTextKey,
              ),
              // AutoSizeText(
              //   quote,
              //   style: GoogleFonts.getFont(
              //     fontSize: currentThemeConfiguration.maxFontSize / 1.2,
              //     currentThemeConfiguration.fontName,
              //     color: currentThemeConfiguration.textColor,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   maxFontSize: currentThemeConfiguration.maxFontSize,
              //   minFontSize: currentThemeConfiguration.minFontSize,
              //   maxLines: 18,
              //   overflow: TextOverflow.ellipsis,
              //   softWrap: true,
              //   stepGranularity: .5,
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: context.normalValue),
              // AutoSizeText(
              //   author,
              //   style: GoogleFonts.getFont(
              //     currentThemeConfiguration.fontName,
              //     color: currentThemeConfiguration.textColor,
              //     fontWeight: FontWeight.w400,
              //     fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
              //   ),
              //   maxFontSize: context.textTheme.titleMedium?.fontSize ?? 22,
              //   maxLines: 1,
              //   minFontSize: context.textTheme.titleSmall?.fontSize ?? 14,
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      );
    }

    return Positioned.fill(
      left: viewModel._themeConfigurationService.defaultRect.left,
      right: context.width - viewModel._themeConfigurationService.defaultRect.right,
      top: viewModel._themeConfigurationService.defaultRect.top - 16,
      child: Center(
        child: ColoredBox(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  text: viewModel.quoteModel.quote,
                  children: [
                    TextSpan(
                      text: '\n\n-${viewModel.quoteModel.author}',
                      style: GoogleFonts.getFont(
                        viewModel.currentThemeConfiguration.fontName,
                        color: viewModel.currentThemeConfiguration.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
                      ),
                    ),
                  ],
                ),
                style: GoogleFonts.getFont(
                  fontSize: viewModel.currentThemeConfiguration.maxFontSize / 1.2,
                  viewModel.currentThemeConfiguration.fontName,
                  color: viewModel.currentThemeConfiguration.textColor,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 18,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                key: viewModel.autoSizeTextKey,
              ),
              // AutoSizeText(
              //   quote,
              //   style: GoogleFonts.getFont(
              //     fontSize: currentThemeConfiguration.maxFontSize / 1.2,
              //     currentThemeConfiguration.fontName,
              //     color: currentThemeConfiguration.textColor,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   maxFontSize: currentThemeConfiguration.maxFontSize,
              //   minFontSize: currentThemeConfiguration.minFontSize,
              //   maxLines: 18,
              //   overflow: TextOverflow.ellipsis,
              //   softWrap: true,
              //   stepGranularity: .5,
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: context.normalValue),
              // AutoSizeText(
              //   author,
              //   style: GoogleFonts.getFont(
              //     currentThemeConfiguration.fontName,
              //     color: currentThemeConfiguration.textColor,
              //     fontWeight: FontWeight.w400,
              //     fontSize: context.textTheme.titleMedium?.fontSize ?? 22,
              //   ),
              //   maxFontSize: context.textTheme.titleMedium?.fontSize ?? 22,
              //   maxLines: 1,
              //   minFontSize: context.textTheme.titleSmall?.fontSize ?? 14,
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Align(
            alignment: viewModel.textAlign.toAlignment,
            child: AutoSizeText.rich(
              TextSpan(
                text: viewModel.quoteModel.quote,
                children: [
                  TextSpan(
                    text: '\n\n-${viewModel.quoteModel.author}',
                    style: viewModel.authorTextStyle.copyWith(fontSize: viewModel.quoteFontSize * .75),
                  ),
                ],
              ),
              style: viewModel.quoteTextStyle,
              maxLines: 18,
              overflow: TextOverflow.ellipsis,
              textAlign: viewModel.textAlign,
              key: viewModel.autoSizeTextKey,
            ),
          ),
        ),
        // SizedBox(height: context.lowValue),
        // Align(
        //   alignment: viewModel.textAlign.toAlignment,
        //   child: AutoSizeText(
        //     '-${viewModel.quoteModel.author}',
        //     style: viewModel.authorTextStyle.copyWith(fontSize: viewModel.quoteFontSize * .65),
        //     maxLines: 1,
        //     minFontSize: viewModel.currentThemeConfiguration.minFontSize,
        //     textAlign: viewModel.textAlign,
        //   ),
        // ),
      ],
    );

    // return Padding(
    //   padding: const PaddingConstants.screenPaddingHorizontal(),
    //   child: FractionallySizedBox(
    //     heightFactor: .85,
    //     alignment: const Alignment(0, -.6),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Column(
    //           key: viewModel.autoSizeGroupKey,
    //           children: [
    //             Align(
    //               alignment: viewModel.textAlign.toAlignment,
    //               child: AutoSizeText(
    //                 viewModel.quoteModel.quote,
    //                 key: viewModel.autoSizeTextKey,
    //                 style: viewModel.quoteTextStyle,
    //                 minFontSize: viewModel.currentThemeConfiguration.minFontSize,
    //                 maxLines: 18,
    //                 overflow: TextOverflow.ellipsis,
    //                 softWrap: true,
    //                 stepGranularity: .5,
    //                 textAlign: viewModel.textAlign,
    //               ),
    //             ),
    //             SizedBox(height: context.lowValue),
    //             Align(
    //               alignment: viewModel.textAlign.toAlignment,
    //               child: AutoSizeText(
    //                 '-${viewModel.quoteModel.author}',
    //                 style: viewModel.authorTextStyle,
    //                 maxLines: 1,
    //                 minFontSize: viewModel.currentThemeConfiguration.minFontSize,
    //                 textAlign: viewModel.textAlign,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

@immutable
final class __FontChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __FontChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.normalVertical() + const PaddingConstants.lowHorizontal(),
      child: CustomDropdown<DefaultFontsEnum>(
        decoration: CustomDropdownDecoration(
          closedFillColor: context.colors.onSurface.withOpacity(.5),
        ),
        overlayHeight: context.height * .6,
        items: viewModel.allDefaultFontList.map((e) => e).toList(),
        initialItem: DefaultFontsEnum.values
            .firstWhere((element) => element.fontFamily == viewModel.currentThemeConfiguration.fontName),
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
        onChanged: (p0) {
          if (p0 != null) {
            viewModel.changeFont(
              fontName: p0.fontFamily,
            );
          }
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
        padding: const PaddingConstants.allLow(),
        child: TabBar(
          onTap: (value) {
            viewModel.setTextAlign(viewModel.textAlignList[value]);
          },
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: context.radius12,
              side: BorderSide(color: context.colors.surface.withOpacity(.1)),
            ),
            color: context.colors.surface.withOpacity(.5),
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
      padding: const PaddingConstants.allLow() + const PaddingConstants.lowBottom(),
      child: Row(
        children: [
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                valueIndicatorColor: Colors.white,
                valueIndicatorTextStyle: const TextStyle(color: Colors.black),
                thumbShape: CustomSliderThumbShape(
                  borderColor: context.colors.onSurface.withOpacity(.2),
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
        padding: const PaddingConstants.allLow(),
        child: TabBar(
          onTap: (value) {
            viewModel.fontTypeButtonList[value].onChange.call();
          },
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: context.radius12,
              side: BorderSide(color: context.colors.surface.withOpacity(.1)),
            ),
            color: context.colors.surface.withOpacity(.5),
          ),
          padding: EdgeInsets.zero,
          dividerHeight: 0,
          tabAlignment: TabAlignment.fill,
          tabs: viewModel.fontTypeButtonList
              .map((e) => Tab(icon: Icon(e.icon), iconMargin: EdgeInsets.zero, child: Text(e.text)))
              .toList(),
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
        height: kMinInteractiveDimension + const PaddingConstants.lowVertical().vertical,
      ),
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList.builder(
            itemCount: viewModel.textColorList.length,
            itemBuilder: (context, index) {
              final bool isSelected = viewModel.textColorList[index] == viewModel.quoteTextStyle.color;
              return Padding(
                padding: const PaddingConstants.lowLeft() +
                    const PaddingConstants.lowVertical() +
                    ((index == viewModel.textColorList.length - 1)
                        ? const PaddingConstants.lowRight()
                        : EdgeInsets.zero),
                child: CustomButton.outlined(
                  backgroundColor: viewModel.textColorList[index],
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: context.radius12,
                  //   side: isSelected ? BorderSide(color: context.colors.primary, width: 2) : BorderSide.none,
                  // ),
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

final class __MoveAndResizeSizeChild extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const __MoveAndResizeSizeChild();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.lowVertical() * .5,
      child: Row(
        children: [
          const Text('Move and Resize'),
          const Spacer(),
          CustomButton.text(
            text: 'Save',
            onPressed: viewModel.textRect != null ? () async {} : null,
          ),
        ],
      ),
    );
  }
}

@immutable
final class _ResizableContainer extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const _ResizableContainer();

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return TransformableBox(
      rect: viewModel.textRect,
      resizeModeResolver: () => ResizeMode.freeform,
      clampingRect: viewModel._themeConfigurationService.safeAreaRect,
      // constraints: const BoxConstraints(minHeight: kMinInteractiveDimension, minWidth: kMinInteractiveDimension),
      onChanged: (result, event) {
        final double newfontSize =
            (((result.oldRect.width + result.oldRect.height) / 2) + ((result.rect.width + result.rect.height) / 2)) *
                .1;
        viewModel
          ..setTextRect(result.rect)
          ..changeFontSize(fontSize: viewModel.quoteFontSize + newfontSize);
      },
      allowContentFlipping: false,
      contentBuilder: (context, rect, flip) {
        // ignore: prefer_const_constructors
        return _QuoteAndAuthorWidget();
      },
    );
  }
}
