part of '../home_view.dart';

@immutable
final class _QuoteTextSection extends MultiSelectorViewModelWidget<HomeViewModel, ThemeConfigurationModel, QuoteModel> {
  const _QuoteTextSection({
    required this.quote,
    required this.author,
  });

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context, Tuple<ThemeConfigurationModel, QuoteModel> selectors) {
    final ThemeConfigurationModel currentThemeConfiguration = selectors.selector1;

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
                fontSize: currentThemeConfiguration.maxFontSize / 1.2,
                currentThemeConfiguration.fontName,
                color: currentThemeConfiguration.textColor,
                fontWeight: FontWeight.w400,
              ),
              maxFontSize: currentThemeConfiguration.maxFontSize,
              minFontSize: currentThemeConfiguration.minFontSize,
              maxLines: 18,
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

  ///
  /// Optionally, a second selector can be listened to,
  /// but it is not enough to update this widget only when the themeConfig changes.
  /// It also needs to be updated when the category changes. That's why I'm listening for two parameters.
  ///
  @override
  Tuple<ThemeConfigurationModel, QuoteModel> selector(HomeViewModel viewModel) {
    return Tuple(viewModel.currentThemeConfiguration, viewModel.currentQuote);
  }
}
