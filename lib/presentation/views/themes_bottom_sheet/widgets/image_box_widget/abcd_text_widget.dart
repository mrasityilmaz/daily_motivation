part of '../../themes_bottom_sheet.dart';

@immutable
final class _AbcdTextWidget extends StatelessWidget {
  const _AbcdTextWidget({required this.isPremium, required this.currentThemeConfiguration});
  final bool isPremium;
  final ThemeConfigurationModel currentThemeConfiguration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isPremium ? const Alignment(0, -.3) : Alignment.center,
      child: AutoSizeText(
        'Abcd',
        locale: context.locale,
        maxFontSize: currentThemeConfiguration.maxFontSize,
        minFontSize: currentThemeConfiguration.minFontSize,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont(currentThemeConfiguration.fontName).copyWith(
          fontSize: (currentThemeConfiguration.maxFontSize + currentThemeConfiguration.minFontSize) / 1.4,
          color: currentThemeConfiguration.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
