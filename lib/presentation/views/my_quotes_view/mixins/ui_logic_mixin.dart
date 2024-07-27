part of '../my_quotes_viewmodel.dart';

mixin _UILogicMixin on ChangeNotifier {
  ///
  /// Quote Copy Function
  ///

  Future<void> copyQuote(BuildContext context, {required QuoteHiveModel quote}) async {
    try {
      await Clipboard.setData(ClipboardData(text: '${quote.quote} \n - ${quote.author}')).whenComplete(() async {
        await AppDialogs.instance.showBasicFlushBar(context, message: 'Quote Copied');
      });
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
