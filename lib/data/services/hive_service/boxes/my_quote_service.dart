import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';

@immutable
final class MyQuoteBoxService extends HiveBoxService<QuoteHiveModel> {
  MyQuoteBoxService({required super.boxName, super.fromJson = QuoteHiveModel.fromJson});

  List<QuoteHiveModel> get myQuoteList => box.getAll(box.keys).nonNulls.toList();

  Future<void> addMyQuote(QuoteHiveModel quoteModel) async {
    try {
      box.put(quoteModel.id, quoteModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteMyQuote(String quoteId) async {
    try {
      box.delete(quoteId);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void clearMyQuotes() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> editMyQuotes({required QuoteHiveModel quoteHiveModel}) async {
    try {
      final oldQuote = box.get(quoteHiveModel.id);
      if (oldQuote != null) {
        final editedQuote = oldQuote.copyWith(
          quote: quoteHiveModel.quote,
          author: quoteHiveModel.author,
          createdAt: DateTime.now().toUtc(),
          category: oldQuote.category,
          id: oldQuote.id,
        );
        box.put(oldQuote.id, editedQuote);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
