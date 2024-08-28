part of '../../themes_bottom_sheet.dart';

@immutable
final class _ImageBoxWidget extends ViewModelWidget<ThemesBottomSheetViewModel> with _ImageBoxUILogicMixin {
  const _ImageBoxWidget({
    required this.index,
    required this.constraints,
  }) : super(reactive: false);

  final int index;

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    final String backgroundPath = viewModel.allBackgroundList[index];
    final DefaultFontsEnum font = viewModel.allDefaultFontList[index % viewModel.allDefaultFontList.length];

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
      height: constraints.biggest.height,
      width: constraints.biggest.width,

      fit: BoxFit.cover,
    ).image;

    return ImagePixels(
      imageProvider: imageProvider,
      defaultColor: context.colors.onSurface,
      builder: (context, img) {
        final Color textColor =
            context.getXorColor(img.pixelColorAtAlignment?.call(const Alignment(0, -.1)) ?? Colors.white);
        return InkWell(
          borderRadius: context.radius12,
          onTap: () async => onChooseThemeCallback(
            context,
            isLocked: isLocked,
            onChanged: () async => viewModel.updateThemeConfiguration(
              model: ThemeConfigurationModel(
                backgroundPath: backgroundPath,
                fontName: font.fontFamily,
                maxFontSize: font.maxFontSize,
                minFontSize: font.minFontSize,
                textColor: textColor,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
              borderRadius: context.radius12,
              border: Border.all(color: context.colors.onSurface.withOpacity(.1)),
            ),
            padding: context.paddingLow,
            child: __ImageBoxTextSection(
              font: font,
              textColor: textColor,
              fontNameTextColor:
                  context.getXorColor(img.pixelColorAtAlignment?.call(Alignment.bottomCenter) ?? Colors.white),
              isLocked: isLocked,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> onChooseThemeCallback(
    BuildContext context, {
    required bool isLocked,
    required Future<void> Function() onChanged,
  }) async {
    try {
      late final Future<bool?> future = ProgressOverlayDialog.instance.showProgressOverlay<bool>(
        context,
        asyncProcess: () async {
          await Future.delayed(Duration(milliseconds: isLocked ? 500 : 300), () async {
            await onChanged.call();
          });

          return true;
        },
      ).then((result) async {
        if (result == true) {
          await locator<AppRouter>().maybePop();
        }

        return true;
      });

      ///
      ///
      ///

      if (isLocked == false) {
        await future;
      } else {
        await AppDialogs.instance.showDialog<bool?>(
          context,
          child: ShowOrPayDialogBody(
            icon: Icon(
              Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
              size: kMinInteractiveDimension * 1.2,
              color: context.colors.primary,
            ),
            firstButtonText: 'Reklam İzle',
            secondButtonText: 'Premium Ol',
            firstButtonOnPressed: () async {
              await locator<AppRouter>().maybePop().whenComplete(() async {
                await future;
              });
            },
            title: 'Seçili Temanın Kilidini Aç',
          ),
        );
      }
    } catch (e, s) {
      await locator<AppRouter>().maybePop();
      ProgressOverlayDialog.instance.closeOverlay();
      LoggerService.instance.catchLog(e, s);
    }
  }
}
