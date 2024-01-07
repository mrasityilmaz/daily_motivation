part of '../home_view.dart';

@immutable
final class _QuoteTextSection extends StatelessWidget {
  const _QuoteTextSection({
    required this.quote,
    required this.author,
  });

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.screenPaddingHorizontal,
      child: FractionallySizedBox(
        heightFactor: .85,
        alignment: const Alignment(0, -.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'You only live once, but if you do it right, once is enough.',
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
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
              '- Mae West',
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
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
}
