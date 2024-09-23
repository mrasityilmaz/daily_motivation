import 'dart:async';

import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';

@immutable
final class LikedQuoteBoxService extends HiveBoxService<QuoteHiveModel> {
  LikedQuoteBoxService({required super.boxName, super.fromJson = QuoteHiveModel.fromMap});

  List<QuoteHiveModel> get likedQuoteList {
    return box.getAll(box.keys).nonNulls.toList();
  }

  bool isQuoteLiked(String quoteId) {
    return box.containsKey(quoteId);
  }

  Future<void> likeQuote(QuoteHiveModel quoteModel) async {
    try {
      box.put(quoteModel.id, quoteModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> unLikeQuote(String quoteId) async {
    try {
      box.delete(quoteId);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void clearLikedQuotes() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
