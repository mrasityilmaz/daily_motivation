part of '../home_view.dart';

@immutable
final class _SwipableBodySection extends ViewModelWidget<HomeViewModel> {
  const _SwipableBodySection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.currentQuoteList.length,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (c) {},
      itemBuilder: (context, index) {
        final QuoteModel quoteModel = viewModel.currentQuoteList[index];
        return _QuoteTextSection(
          quote: quoteModel.quote,
          author: '- ${quoteModel.author}',
        );
      },
    );
  }
}
