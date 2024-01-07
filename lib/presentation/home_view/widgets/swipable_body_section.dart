part of '../home_view.dart';

@immutable
final class _SwipableBodySection extends StatelessWidget {
  const _SwipableBodySection();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 50,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (c) {},
      itemBuilder: (context, index) {
        return const _QuoteTextSection(
          quote: 'You only live once, but if you do it right, once is enough.',
          author: '- Mae West',
        );
      },
    );
  }
}
