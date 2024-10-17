import 'dart:async';

import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';

@immutable
final class LikedQuoteBoxService extends HiveBoxService<QuoteModel> {
  LikedQuoteBoxService() : super(boxName: HiveConstants.likedQuotesBoxKey, fromJson: QuoteModel.fromJson);

  List<QuoteModel> get likedQuoteList {
    return box.getAll(box.keys).nonNulls.toList();
  }

  bool isQuoteLiked(String quoteId) {
    return box.containsKey(quoteId);
  }

  Future<void> likeQuote(QuoteModel quoteModel) async {
    try {
      box.put(quoteModel.id, quoteModel);
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  Future<void> unLikeQuote(String quoteId) async {
    try {
      box.delete(quoteId);
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  void clearLikedQuotes() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }
}
