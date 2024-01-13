part of '../themes_bottom_sheet.dart';

@immutable
final class _ImageBoxWidget extends StatelessWidget {
  const _ImageBoxWidget({required this.fontName, required this.backgroundPath, required this.onChanged});
  final String fontName;
  final String backgroundPath;
  final ValueChanged<ThemeConfigurationModel> onChanged;

  @override
  Widget build(BuildContext context) {
    final String currentBackgroundPath = backgroundPath;
    final ImageProvider imageProvider = AssetImage(currentBackgroundPath);

    return ImagePixels(
      imageProvider: imageProvider,
      defaultColor: context.colors.onBackground,
      builder: (context, img) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async => onChanged(
            ThemeConfigurationModel(
              backgroundPath: currentBackgroundPath,
              fontName: fontName,
              textColor: context.getXorColor(
                img.pixelColorAtAlignment!.call(Alignment.center),
              ),
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
              fontName: fontName,
              textColor: context.getXorColor(img.pixelColorAtAlignment!.call(Alignment.center)),
            ),
          ),
        );
      },
    );
  }
}

@immutable
final class __ImageBoxTextSection extends StatelessWidget {
  const __ImageBoxTextSection({required this.fontName, required this.textColor});

  final String fontName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Align(
            child: FractionallySizedBox(
              widthFactor: .9,
              child: AutoSizeText(
                'Abcd',
                locale: context.locale,
                maxFontSize: context.textTheme.headlineLarge!.fontSize!,
                minFontSize: context.textTheme.titleLarge!.fontSize!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(fontName).copyWith(
                  fontSize: 30,
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
            fontName,
            locale: context.locale,
            maxFontSize: context.textTheme.titleLarge!.fontSize!,
            minFontSize: 10,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(fontName).copyWith(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
