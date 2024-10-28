import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class MyQuotesViewModel extends BaseViewModel {
  final MyQuoteBoxService _myQuoteBoxService = locator<HiveService>().myQuoteBoxService;

  final List<QuoteModel> _myQuoteListStatic = List<QuoteModel>.empty(growable: true);
  List<QuoteModel> get _myQuoteListBasedHive => _myQuoteBoxService.myQuoteList;
  List<QuoteModel> get myQuoteList => [..._myQuoteListStatic, ..._myQuoteListBasedHive]
    ..sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()))
    ..toSet();

  Future<void> _deleteQuote(String quoteId) async {
    try {
      await runBusyFuture(_myQuoteBoxService.deleteMyQuote(quoteId), busyObject: ValueKey(quoteId));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  void _addOrUpdateTemporarilyAddedQuote(QuoteModel quoteModel) {
    if (_myQuoteListBasedHive.any((element) => element.id != quoteModel.id) &&
        _myQuoteListStatic.any((element) => element.id != quoteModel.id)) {
      _myQuoteListStatic.add(quoteModel);
    }
    notifyListeners();
  }

  Future<void> onPressedAddMyQuoteButton() async {
    try {
      final quote = await locator<AppRouter>().push<QuoteModel?>(AddNewOrEditQuoteViewRoute());

      if (quote != null) {
        debugPrint('Quote: $quote');
        _addOrUpdateTemporarilyAddedQuote(quote);
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  Future<void> onPressedEditMyQuoteButton({required QuoteModel quoteHiveModel}) async {
    try {
      final result =
          await locator<AppRouter>().push<QuoteModel?>(AddNewOrEditQuoteViewRoute(editQuote: quoteHiveModel));
      if (result != null) {
        debugPrint('Quote: $result');
        _addOrUpdateTemporarilyAddedQuote(result);
      } else {}
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  Future<void> onPressedDeleteMyQuoteButton({required String id}) async {
    await _deleteQuote(id);
  }
}
