part of '../home_view.dart';

@immutable
final class _SwipableBodySection extends VSelectorViewModelWidget<HomeViewModel, List<QuoteModel>> {
  const _SwipableBodySection();

  @override
  Widget build(BuildContext context, List<QuoteModel> quoteList, HomeViewModel viewModel) {
    return PageView.builder(
      itemCount: quoteList.length,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      onPageChanged: viewModel.onPageChanged,
      controller: viewModel.pageController,
      itemBuilder: (context, index) {
        final QuoteModel quoteModel = quoteList[index];
        return _QuoteTextSection(
          quote: quoteModel.quote,
          author: '- ${quoteModel.author}',
        );
      },
    );
  }

  @override
  List<QuoteModel> selector(HomeViewModel viewModel) {
    return viewModel.currentQuoteList;
  }
}
