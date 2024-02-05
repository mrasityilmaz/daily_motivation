part of '../hive_service.dart';

mixin _LikedQuoteServiceMixin {
  late final Box<QuoteHiveModel> _likedQuoteBox = Hive.box<QuoteHiveModel>(HiveConstants.likedQuotesBoxKey);

  List<QuoteHiveModel> get likedQuoteList => _likedQuoteBox.values.toList();

  bool isQuoteLiked(String quoteId) {
    return _likedQuoteBox.containsKey(quoteId);
  }

  Future<void> likeQuote(QuoteHiveModel quoteModel) async {
    try {
      await _likedQuoteBox.put(quoteModel.id, quoteModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> unLikeQuote(String quoteId) async {
    try {
      await _likedQuoteBox.delete(quoteId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearLikedQuotes() async {
    try {
      await _likedQuoteBox.clear();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
