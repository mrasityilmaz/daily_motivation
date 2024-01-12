part of '../home_view.dart';

@immutable
final class _SwipableBodySection extends StatelessWidget {
  const _SwipableBodySection(this.list);
  final List<QuoteModel> list;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (c) {},
      itemBuilder: (context, index) {
        final QuoteModel quoteModel = list[index];
        return _QuoteTextSection(
          quote: quoteModel.quote,
          author: '- ${quoteModel.author}',
        );
      },
    );
  }
}
