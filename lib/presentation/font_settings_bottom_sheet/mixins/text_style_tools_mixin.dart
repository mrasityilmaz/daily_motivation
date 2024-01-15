part of '../font_settings_bottom_sheet.dart';

mixin TextStyleToolsMixin on ReactiveViewModel {
  ///
  /// UI Keys
  ///
  final GlobalKey _autoSizeTextKey = GlobalKey();

  GlobalKey get autoSizeTextKey => _autoSizeTextKey;

  ///
  /// Variables
  ///
  TextStyle _quoteTextStyle = const TextStyle();
  TextStyle _authorTextStyle = const TextStyle();
  TextAlign _textAlign = TextAlign.center;
  int _selectedFontTypeIndex = 0;

  ///
  /// Getters
  ///
  TextStyle get quoteTextStyle => _quoteTextStyle;
  TextStyle get authorTextStyle => _authorTextStyle;
  TextAlign get textAlign => _textAlign;
  double get quoteFontSize => _quoteTextStyle.fontSize ?? (autoSizeTextKey.currentWidget as AutoSizeText?)?.style?.fontSize ?? 9;
  double get authorFontSize => quoteFontSize * .7;

  final List<TextAlign> textAlignList = [TextAlign.left, TextAlign.center, TextAlign.right, TextAlign.justify];

  final List<Color> textColorList = [
    Colors.white,
    Colors.black,
    ...Colors.accents,
    ...Colors.primaries,
  ];

  List<({IconData icon, String text, VoidCallback onChange})> get fontTypeButtonList => [
        (
          icon: Icons.title_rounded,
          text: 'Normal',
          onChange: () {
            _selectedFontTypeIndex = 0;
            changeFontWeight(fontWeight: FontWeight.normal);
          },
        ),
        (
          icon: Icons.format_bold,
          text: 'Bold',
          onChange: () {
            _selectedFontTypeIndex = 1;
            changeFontWeight(fontWeight: FontWeight.bold);
          },
        ),
        (
          icon: Icons.format_italic,
          text: 'Italic',
          onChange: () {
            _selectedFontTypeIndex = 2;
            changeFontStyle(fontStyle: FontStyle.italic);
          },
        ),
        (
          icon: Icons.format_underline,
          text: 'Underline',
          onChange: () {
            _selectedFontTypeIndex = 3;
            changeTextDecoration(textDecoration: TextDecoration.underline);
          },
        ),
      ];

  int get selectedFontTypeIndex => _selectedFontTypeIndex;

  ///
  /// Setters
  ///
  set quoteTextStyle(TextStyle style) {
    _quoteTextStyle = style;
  }

  set authorTextStyle(TextStyle style) {
    _authorTextStyle = style;
  }

  ///
  ///
  /// Methods
  ///
  void changeFont({
    required String fontName,
  }) {
    _quoteTextStyle = GoogleFonts.getFont(fontName).copyWith(
      fontSize: quoteFontSize,
      color: _quoteTextStyle.color,
      fontWeight: _quoteTextStyle.fontWeight,
      fontStyle: _quoteTextStyle.fontStyle,
      decoration: _quoteTextStyle.decoration,
      decorationColor: _quoteTextStyle.decorationColor,
      overflow: TextOverflow.ellipsis,
    );

    _authorTextStyle = GoogleFonts.getFont(fontName).copyWith(
      fontSize: authorFontSize,
      color: _authorTextStyle.color,
      fontWeight: _authorTextStyle.fontWeight,
      fontStyle: _authorTextStyle.fontStyle,
      decoration: _authorTextStyle.decoration,
      decorationColor: _authorTextStyle.decorationColor,
      overflow: TextOverflow.ellipsis,
    );

    notifyListeners();
  }

  void changeFontSize({
    required double fontSize,
  }) {
    _quoteTextStyle = _quoteTextStyle.copyWith(
      fontSize: fontSize,
    );

    _authorTextStyle = _authorTextStyle.copyWith(
      fontSize: fontSize * .7,
    );

    notifyListeners();
  }

  void changeTextColor({
    required Color color,
  }) {
    _quoteTextStyle = _quoteTextStyle.copyWith(
      color: color,
    );

    _authorTextStyle = _authorTextStyle.copyWith(
      color: color,
    );

    notifyListeners();
  }

  void setTextAlign(TextAlign align) {
    _textAlign = align;
    notifyListeners();
  }

  void changeFontWeight({
    required FontWeight fontWeight,
  }) {
    _quoteTextStyle = _quoteTextStyle.copyWith(
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );

    _authorTextStyle = _authorTextStyle.copyWith(
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );

    notifyListeners();
  }

  void changeFontStyle({
    required FontStyle fontStyle,
  }) {
    _quoteTextStyle = _quoteTextStyle.copyWith(
      fontStyle: fontStyle,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );

    _authorTextStyle = _authorTextStyle.copyWith(
      fontStyle: fontStyle,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );

    notifyListeners();
  }

  void changeTextDecoration({
    required TextDecoration textDecoration,
  }) {
    _quoteTextStyle = _quoteTextStyle.copyWith(
      decoration: textDecoration,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    );

    _authorTextStyle = _authorTextStyle.copyWith(
      decoration: textDecoration,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    );

    notifyListeners();
  }
}
