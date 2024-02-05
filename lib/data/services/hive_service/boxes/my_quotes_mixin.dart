part of '../hive_service.dart';

mixin _MyQuotesServiceMixin {
  late final Box<QuoteHiveModel> _myQuotesBox = Hive.box<QuoteHiveModel>(HiveConstants.myQuotesBoxKey);

  List<QuoteHiveModel> get myQuoteList => _myQuotesBox.values.toList();

  Future<void> addMyQuote(QuoteHiveModel quoteModel) async {
    try {
      await _myQuotesBox.put(quoteModel.id, quoteModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteMyQuote(String quoteId) async {
    try {
      await _myQuotesBox.delete(quoteId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearMyQuotes() async {
    try {
      await _myQuotesBox.clear();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editMyQuotes({required QuoteHiveModel quoteHiveModel}) async {
    try {
      final oldQuote = _myQuotesBox.get(quoteHiveModel.id);
      if (oldQuote != null) {
        final editedQuote = oldQuote.copyWith(
          quote: quoteHiveModel.quote,
          author: quoteHiveModel.author,
          createdAt: DateTime.now().toUtc(),
          category: oldQuote.category,
          id: oldQuote.id,
        );
        await _myQuotesBox.put(oldQuote.id, editedQuote);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
