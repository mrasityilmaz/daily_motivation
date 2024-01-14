part of '../font_settings_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_FontSettingsBottomSheetViewModel> {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, _FontSettingsBottomSheetViewModel viewModel) {
    return Container(
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
          SafeArea(
            minimum: context.adaptiveScreenPaddingBottom + context.screenPadding,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomDropdown<DefaultFontsEnum>(
                decoration: CustomDropdownDecoration(
                  closedFillColor: context.colors.surface.withOpacity(.5),
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
            ),
          ),
        ],
      ),
    );
  }
}
