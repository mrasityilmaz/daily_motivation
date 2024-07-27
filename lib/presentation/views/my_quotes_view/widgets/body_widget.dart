part of '../my_quotes_view.dart';

@immutable
final class _MyQuotesViewBodyWidget extends SelectorViewModelWidget<MyQuotesViewModel, List<QuoteHiveModel>> {
  const _MyQuotesViewBodyWidget();

  @override
  Widget build(BuildContext context, List<QuoteHiveModel> myQuoteList) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: myQuoteList.length,
            itemBuilder: (context, index) {
              final quote = myQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }

  @override
  List<QuoteHiveModel> selector(MyQuotesViewModel viewModel) {
    return viewModel.myQuoteList;
  }
}
