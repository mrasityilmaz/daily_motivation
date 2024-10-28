part of '../my_quotes_view.dart';

mixin _UILogicMixin {
  ///
  /// Quote Copy Function
  ///

  Future<void> copyQuote(BuildContext context, {required QuoteModel quote}) async {
    try {
      await Clipboard.setData(ClipboardData(text: '${quote.quote} \n - ${quote.author}')).whenComplete(() async {
        await AppDialogs.instance.showBasicFlushBar(context, message: 'Quote Copied');
      });
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }
}
