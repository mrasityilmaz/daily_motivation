part of '../favorites_view.dart';

@immutable
final class _FavoritesViewBodyWidget extends SelectorViewModelWidget<FavoritesViewModel, List<QuoteHiveModel>> {
  const _FavoritesViewBodyWidget();

  @override
  Widget build(BuildContext context, List<QuoteHiveModel> likedQuoteList) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
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
  List<QuoteHiveModel> selector(FavoritesViewModel viewModel) {
    return viewModel.likedQuoteList;
  }
}
