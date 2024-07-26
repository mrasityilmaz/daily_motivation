part of '../favorites_view.dart';

@immutable
final class _FavoritesViewBodyWidget extends ViewModelWidget<FavoritesViewModel> {
  const _FavoritesViewBodyWidget();

  @override
  Widget build(BuildContext context, FavoritesViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: viewModel.likedQuoteList.length,
            itemBuilder: (context, index) {
              final quote = viewModel.likedQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        SliverSafeArea(
          minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
          sliver: const SliverToBoxAdapter(
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
