part of '../home_view.dart';

@immutable
final class _QuoteTextSection extends SelectorViewModelWidget<HomeViewModel, ThemeConfigurationModel> {
  const _QuoteTextSection({
    required this.quote,
    required this.author,
  });

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context, ThemeConfigurationModel currentThemeConfiguration) {
    return Padding(
      padding: context.screenPaddingHorizontal,
      child: FractionallySizedBox(
        heightFactor: .85,
        alignment: const Alignment(0, -.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              quote,
              style: GoogleFonts.getFont(
                currentThemeConfiguration.fontName,
                color: currentThemeConfiguration.textColor,
                fontWeight: FontWeight.w400,
                fontSize: context.textTheme.headlineMedium?.fontSize ?? 26,
              ),
              maxFontSize: context.textTheme.headlineSmall?.fontSize ?? 26,
              maxLines: 18,
              minFontSize: context.textTheme.labelMedium?.fontSize ?? 14,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              stepGranularity: .5,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.normalValue),
            AutoSizeText(
              author,
              style: GoogleFonts.getFont(
                currentThemeConfiguration.fontName,
                color: currentThemeConfiguration.textColor,
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
    );
  }

  @override
  ThemeConfigurationModel selector(HomeViewModel viewModel) {
    return viewModel.currentThemeConfiguration;
  }
}
