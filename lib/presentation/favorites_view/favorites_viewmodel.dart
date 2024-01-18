part of 'favorites_view.dart';

final class _FavoritesViewModel extends BaseViewModel {
  final HiveService _hiveService = HiveService.instance;

  List<QuoteHiveModel> get likedQuoteList => _hiveService.likedQuoteList..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  Future<void> unLikeQuote(String quoteId) async {
    try {
      await runBusyFuture(_hiveService.unLikeQuote(quoteId), busyObject: ValueKey(quoteId));
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearLikedQuotes() async {
    try {
      await runBusyFuture(_hiveService.clearLikedQuotes());
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
