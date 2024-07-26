part of '../my_quotes_view.dart';

@immutable
final class _MyQuotesViewBodyWidget extends ViewModelWidget<MyQuotesViewModel> {
  const _MyQuotesViewBodyWidget();

  @override
  Widget build(BuildContext context, MyQuotesViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: viewModel.myQuoteList.length,
            itemBuilder: (context, index) {
              final quote = viewModel.myQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }
}
