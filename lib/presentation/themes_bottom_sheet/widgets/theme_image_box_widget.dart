part of '../themes_bottom_sheet.dart';

@immutable
final class _ImageBoxWidget extends StatelessWidget {
  const _ImageBoxWidget({required this.font, required this.backgroundPath, required this.onChanged, this.isLocked = true});
  final DefaultFontsEnum font;
  final String backgroundPath;
  final ValueChanged<ThemeConfigurationModel> onChanged;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    final String currentBackgroundPath = backgroundPath;

    final ImageProvider imageProvider = AssetImage(currentBackgroundPath);

    return ImagePixels(
      imageProvider: imageProvider,
      defaultColor: context.colors.onBackground,
      builder: (context, img) {
        final Color textColor = context.getXorColor(img.pixelColorAtAlignment!.call(const Alignment(0, -.5)));
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isLocked
              ? () async {
                  await AppDialogs.instance.showDialog<void>(
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
                        await ProgressOverlayDialog.instance.showProgressOverlay<bool>(
                          context,
                          asyncProcess: () async {
                            return Future.delayed(const Duration(seconds: 2), () async {
                              return true;
                            });
                          },
                        ).then((value) {
                          if (value == true) {
                            onChanged(
                              ThemeConfigurationModel(
                                backgroundPath: currentBackgroundPath,
                                fontName: font.fontFamily,
                                maxFontSize: font.maxFontSize,
                                minFontSize: font.minFontSize,
                                textColor: textColor,
                              ),
                            );

                            locator<AppRouter>().pop();
                          }
                        });
                      },
                      title: 'Seçili Temanın Kilidini Aç',
                    ),
                  );
                }
              : () async => onChanged(
                    ThemeConfigurationModel(
                      backgroundPath: currentBackgroundPath,
                      fontName: font.fontFamily,
                      maxFontSize: font.maxFontSize,
                      minFontSize: font.minFontSize,
                      textColor: textColor,
                    ),
                  ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                scale: .000000001,
              ),
              borderRadius: context.radius12,
              border: Border.all(color: context.colors.onBackground.withOpacity(.1), width: 2),
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
}

@immutable
final class __ImageBoxTextSection extends StatelessWidget {
  const __ImageBoxTextSection({required this.font, required this.textColor, required this.fontNameTextColor, this.isLocked = true});

  final DefaultFontsEnum font;
  final Color textColor;
  final Color fontNameTextColor;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Align(
                child: FractionallySizedBox(
                  widthFactor: .9,
                  child: AutoSizeText(
                    'Abcd',
                    locale: context.locale,
                    maxFontSize: font.maxFontSize,
                    minFontSize: font.minFontSize,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(font.fontFamily).copyWith(
                      fontSize: (font.maxFontSize + font.minFontSize) / 1.4,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: .9,
              child: AutoSizeText(
                font.fontFamily,
                locale: context.locale,
                maxFontSize: font.maxFontSize,
                minFontSize: font.minFontSize,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(font.fontFamily).copyWith(
                  fontSize: (font.maxFontSize + font.minFontSize) / 3,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        if (isLocked) ...[
          Align(
            alignment: const Alignment(0, .6),
            child: FractionallySizedBox(
              widthFactor: .4,
              child: LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth,
                  height: constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: context.colors.background.withOpacity(.5),
                    borderRadius: context.radius8,
                  ),
                  child: FractionallySizedBox(
                    heightFactor: .5,
                    widthFactor: .5,
                    child: FittedBox(
                      child: Icon(CupertinoIcons.lock_fill, color: context.colors.onBackground, size: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
