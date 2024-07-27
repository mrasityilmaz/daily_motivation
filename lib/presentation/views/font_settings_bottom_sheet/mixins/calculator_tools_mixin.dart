part of '../font_settings_bottom_sheet.dart';

mixin CalculatorMixin {
  double calculateMaximumFontSize({required String quote, required String author, required double maxHeight, required double maxWidth}) {
    print('calculateMaximumFontSize');
    double fontHeight = 0;

    double counter = 9;

    do {
      fontHeight = _getFontHeight(quote: quote, author: author, maxHeight: maxHeight, maxWidth: maxWidth, fontSize: counter);
      counter += .5;
    } while (fontHeight < maxHeight);

    return counter;
  }

  double _getFontHeight({required String quote, required String author, required double maxHeight, required double maxWidth, required double fontSize}) {
    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr)
      ..text = TextSpan(
        text: quote,
        style: TextStyle(fontSize: fontSize),
        children: [
          TextSpan(
            text: author,
            style: TextStyle(fontSize: fontSize * .7),
          ),
        ],
      )
      ..layout(
        maxWidth: maxWidth,
      );

    return textPainter.height;
  }
}
