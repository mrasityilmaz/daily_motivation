import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:quotely/data/services/hive_service/i_hivebox_service.dart';

final class LikedQuoteBoxService extends IHiveBoxService<QuoteHiveModel> {
  LikedQuoteBoxService({required super.boxKey});

  @override
  Box<QuoteHiveModel> get box => Hive.box<QuoteHiveModel>(boxKey);

  List<QuoteHiveModel> get likedQuoteList => box.values.toList();

  bool isQuoteLiked(String quoteId) {
    return box.containsKey(quoteId);
  }

  Future<void> likeQuote(QuoteHiveModel quoteModel) async {
    try {
      await box.put(quoteModel.id, quoteModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> unLikeQuote(String quoteId) async {
    try {
      await box.delete(quoteId);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearLikedQuotes() async {
    try {
      await super.clearBox();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
