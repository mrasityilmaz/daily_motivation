part of 'add_new_or_edit_quote_view.dart';

final class _AddNewQuoteViewModel extends BaseViewModel {
  _AddNewQuoteViewModel({required this.editQuote});

  final QuoteHiveModel? editQuote;

  final MyQuoteBoxService _myQuoteBoxService = HiveService.instance.myQuoteBoxService;
  late final TextEditingController quoteTextController;
  late final TextEditingController authorTextController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  String get quote => quoteTextController.text;

  String get author => authorTextController.text.trim().isNotEmpty ? authorTextController.text : '';

  Future<void> saveQuote() async {
    try {
      if (isFormValid) {
        final QuoteHiveModel? result = await runBusyFuture<QuoteHiveModel?>(
          Future.delayed(const Duration(milliseconds: 300), () async {
            late final QuoteHiveModel quoteModel;
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

        await locator<AppRouter>().pop<QuoteHiveModel?>(result);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  QuoteHiveModel get newQuoteModel => QuoteHiveModel(
        category: 'myquotes',
        author: author,
        id: const Uuid().v4(),
        createdAt: DateTime.now().toUtc(),
        quote: quote,
      );

  void _clearTextFields() {
    quoteTextController.clear();
    authorTextController.clear();
  }

  void onReady() {
    quoteTextController = TextEditingController(text: editQuote?.quote ?? '');
    authorTextController = TextEditingController(text: editQuote?.author ?? '');
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    authorTextController.dispose();
    super.dispose();
  }
}
