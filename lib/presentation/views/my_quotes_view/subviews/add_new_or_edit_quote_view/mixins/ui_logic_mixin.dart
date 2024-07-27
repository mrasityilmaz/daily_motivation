part of '../add_new_or_edit_quote_viewmodel.dart';

mixin _UILogicMixin on ChangeNotifier {
  ///
  /// Controllers
  ///

  late final TextEditingController quoteTextController;
  late final TextEditingController authorTextController;

  ///
  /// Form Key
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///
  /// Getters
  ///
  bool get isFormValid => formKey.currentState?.validate() ?? false;

  ///
  /// Function
  ///
  void _clearTextFields() {
    quoteTextController.clear();
    authorTextController.clear();
  }

  ///
  /// UI Controllers Init and dispose
  ///
  void onReady(QuoteHiveModel? editQuote) {
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
