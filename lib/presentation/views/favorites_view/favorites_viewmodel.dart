import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/dialogs/dialog_helper.dart';
import 'package:stacked/stacked.dart';

part 'mixins/multiple_choose_helper_mixin.dart';
part 'mixins/ui_logic_mixin.dart';

class FavoritesViewModel extends BaseViewModel with _MultipleChooseHelperMixin, _UILogicMixin {
  final LikedQuoteBoxService _likedQuoteBoxService = locator<HiveService>().likedQuoteBoxService;

  List<QuoteModel> get likedQuoteList => _likedQuoteBoxService.likedQuoteList
    ..sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));

  ///
  /// This function remove only unliked quotes from the box
  ///

  Future<void> unLikeQuote(String quoteId) async {
    try {
      await runBusyFuture(_likedQuoteBoxService.unLikeQuote(quoteId), busyObject: ValueKey(quoteId));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  ///
  /// This function remove all liked quotes from the box
  ///

  Future<void> clearLikedQuotes() async {
    try {
      _likedQuoteBoxService.clearLikedQuotes();
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }
}
