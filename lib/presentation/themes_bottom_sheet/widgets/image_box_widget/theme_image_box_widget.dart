part of '../../themes_bottom_sheet.dart';

@immutable
final class _ImageBoxWidget extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _ImageBoxWidget({required this.index, required this.font, required this.backgroundPath, required this.constraints}) : super(reactive: false);
  final DefaultFontsEnum font;
  final String backgroundPath;
  final int index;

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    final bool isLocked = viewModel.isThemeConfigPremium(index);

    ///
    /// ImageProvider for ImagePixel's to calculate text color
    ///
    final ImageProvider imageProvider = Image.asset(
      backgroundPath,

      ///
      /// These parameters must be assigned because high-dimensional images may cause optimization problems.
      ///
      cacheWidth: constraints.biggest.width.toInt(),
      cacheHeight: constraints.biggest.height.toInt(),
      fit: BoxFit.cover,
    ).image;

    return ImagePixels(
      imageProvider: imageProvider,
      defaultColor: context.colors.onSurface,
      builder: (context, img) {
        final Color textColor = context.getXorColor(img.pixelColorAtAlignment!.call(const Alignment(0, -.1)));
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async => _onTap(context, isLocked: isLocked, textColor: textColor, viewModel: viewModel),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: context.radius12,
              border: Border.all(color: context.colors.onSurface.withOpacity(.1)),
            ),
            padding: context.paddingLow,
            child: __ImageBoxTextSection(
              font: font,
              textColor: textColor,
              fontNameTextColor: context.getXorColor(img.pixelColorAtAlignment!.call(Alignment.bottomCenter)),
              isLocked: isLocked,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onTap(BuildContext context, {required ThemesBottomSheetViewModel viewModel, required Color textColor, required bool isLocked}) async {
    return viewModel.updateThemeConfigurationAndPop(
      context,
      isLocked: isLocked,
      model: ThemeConfigurationModel(
        backgroundPath: backgroundPath,
        fontName: font.fontFamily,
        maxFontSize: font.maxFontSize,
        minFontSize: font.minFontSize,
        textColor: textColor,
      ),
    );
  }
}
