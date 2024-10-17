part of '../favorites_view.dart';

@immutable
final class _FavoritesViewBodyWidget extends SelectorViewModelWidget<FavoritesViewModel, List<QuoteModel>> {
  const _FavoritesViewBodyWidget();

  @override
  Widget build(BuildContext context, List<QuoteModel> likedQuoteList) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const PaddingConstants.screenPadding(),
          sliver: SliverList.builder(
            itemCount: likedQuoteList.length,
            itemBuilder: (context, index) {
              final quote = likedQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }

  @override
  List<QuoteModel> selector(FavoritesViewModel viewModel) {
    return viewModel.likedQuoteList;
  }
}
