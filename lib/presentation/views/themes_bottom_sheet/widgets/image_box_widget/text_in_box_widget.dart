part of '../../themes_bottom_sheet.dart';

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
                    color: context.colors.surface.withOpacity(.5),
                    borderRadius: context.radius8,
                  ),
                  child: FractionallySizedBox(
                    heightFactor: .5,
                    widthFactor: .5,
                    child: FittedBox(
                      child: Icon(CupertinoIcons.lock_fill, color: context.colors.onSurface, size: 20),
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
