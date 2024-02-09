part of 'favorites_view.dart';

final class _FavoritesViewModel extends BaseViewModel {
  final LikedQuoteBoxService _likedQuoteBoxService = HiveService.instance.likedQuoteBoxService;

  List<QuoteHiveModel> get likedQuoteList => _likedQuoteBoxService.likedQuoteList..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  Future<void> unLikeQuote(String quoteId) async {
    try {
      await runBusyFuture(_likedQuoteBoxService.unLikeQuote(quoteId), busyObject: ValueKey(quoteId));
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearLikedQuotes() async {
    try {
      await runBusyFuture(_likedQuoteBoxService.clearLikedQuotes());
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
