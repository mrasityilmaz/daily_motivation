import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/i_hivebox_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class MyQuoteBoxService extends IHiveBoxService<QuoteHiveModel> {
  MyQuoteBoxService({required super.boxKey});

  @override
  Box<QuoteHiveModel> get box => Hive.box<QuoteHiveModel>(boxKey);

  List<QuoteHiveModel> get myQuoteList => box.values.toList();

  Future<void> addMyQuote(QuoteHiveModel quoteModel) async {
    try {
      await box.put(quoteModel.id, quoteModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteMyQuote(String quoteId) async {
    try {
      await box.delete(quoteId);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearMyQuotes() async {
    try {
      await super.clearBox();
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
        await box.put(oldQuote.id, editedQuote);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
