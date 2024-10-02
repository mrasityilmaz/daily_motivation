import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

part 'mixins/ui_logic_mixin.dart';

final class AddNewOrEditQuoteViewModel extends BaseViewModel with _UILogicMixin {
  AddNewOrEditQuoteViewModel({required this.editQuote});

  final QuoteModel? editQuote;

  final MyQuoteBoxService _myQuoteBoxService = locator<HiveService>().myQuoteBoxService;

  String get quote => quoteTextController.text;

  String get author => authorTextController.text.trim().isNotEmpty ? authorTextController.text : '';

  Future<void> saveQuote() async {
    try {
      if (isFormValid) {
        final QuoteModel? result = await runBusyFuture<QuoteModel?>(
          Future.delayed(const Duration(milliseconds: 300), () async {
            late final QuoteModel quoteModel;
            if (editQuote != null) {
              quoteModel = editQuote!.copyWith(quote: quoteTextController.text, author: authorTextController.text);
              await _myQuoteBoxService.editMyQuotes(quoteHiveModel: quoteModel);
            } else {
              quoteModel = newQuoteModel;
              await _myQuoteBoxService.addMyQuote(quoteModel);
            }
            _clearTextFields();

            return quoteModel;
          }),
        );

        await locator<AppRouter>().maybePop<QuoteModel?>(result);
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  QuoteModel get newQuoteModel => QuoteModel(
        category: Categories.myquotes.key,
        author: author,
        id: const Uuid().v4(),
        createdAt: DateTime.now().toUtc(),
        quote: quote,
      );
}
