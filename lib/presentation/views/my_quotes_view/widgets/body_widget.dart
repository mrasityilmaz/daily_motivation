part of '../my_quotes_view.dart';

@immutable
final class _MyQuotesViewBodyWidget extends SelectorViewModelWidget<MyQuotesViewModel, List<QuoteModel>> {
  const _MyQuotesViewBodyWidget();

  @override
  Widget build(BuildContext context, List<QuoteModel> myQuoteList) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const PaddingConstants.screenPadding(),
          sliver: SliverList.builder(
            itemCount: myQuoteList.length,
            itemBuilder: (context, index) {
              final quote = myQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        const SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }

  @override
  List<QuoteModel> selector(MyQuotesViewModel viewModel) {
    return viewModel.myQuoteList;
  }
}
