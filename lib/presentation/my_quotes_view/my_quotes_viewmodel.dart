import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:stacked/stacked.dart';

part 'mixins/ui_logic_mixin.dart';

final class MyQuotesViewModel extends BaseViewModel with _UILogicMixin {
  final MyQuoteBoxService _myQuoteBoxService = locator<HiveService>().myQuoteBoxService;

  final List<QuoteHiveModel> _myQuoteListStatic = List<QuoteHiveModel>.empty(growable: true);
  List<QuoteHiveModel> get _myQuoteListBasedHive => _myQuoteBoxService.myQuoteList;
  List<QuoteHiveModel> get myQuoteList => [..._myQuoteListStatic, ..._myQuoteListBasedHive]
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt))
    ..toSet();

  Future<void> _deleteQuote(String quoteId) async {
    try {
      await runBusyFuture(_myQuoteBoxService.deleteMyQuote(quoteId), busyObject: ValueKey(quoteId));
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void _addOrUpdateTemporarilyAddedQuote(QuoteHiveModel quoteModel) {
    if (_myQuoteListBasedHive.any((element) => element.id != quoteModel.id) && _myQuoteListStatic.any((element) => element.id != quoteModel.id)) {
      _myQuoteListStatic.add(quoteModel);
    }
    notifyListeners();
  }

  Future<void> onPressedAddMyQuoteButton() async {
    try {
      final quote = await locator<AppRouter>().push<QuoteHiveModel?>(AddNewOrEditQuoteViewRoute());

      if (quote != null) {
        debugPrint('Quote: $quote');
        _addOrUpdateTemporarilyAddedQuote(quote);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> onPressedEditMyQuoteButton({required QuoteHiveModel quoteHiveModel}) async {
    try {
      final result = await locator<AppRouter>().push<QuoteHiveModel?>(AddNewOrEditQuoteViewRoute(editQuote: quoteHiveModel));
      if (result != null) {
        debugPrint('Quote: $result');
        _addOrUpdateTemporarilyAddedQuote(result);
      } else {}
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> onPressedDeleteMyQuoteButton({required String id}) async {
    await _deleteQuote(id);
  }
}
