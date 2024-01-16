part of 'font_settings_bottom_sheet.dart';

final class _FontSettingsBottomSheetViewModel extends ReactiveViewModel with CalculatorMixin, ServicesMixin, TextStyleToolsMixin, ScreenDesignToolsMixin {
  _FontSettingsBottomSheetViewModel({required this.quoteModel, required this.context}) {
    quoteTextStyle = GoogleFonts.getFont(
      fontSize: currentThemeConfiguration.maxFontSize / 1.2,
      currentThemeConfiguration.fontName,
      fontWeight: FontWeight.w400,
      color: currentThemeConfiguration.textColor,
      decorationColor: currentThemeConfiguration.textColor,
    );

    authorTextStyle = GoogleFonts.getFont(
      currentThemeConfiguration.fontName,
      color: currentThemeConfiguration.textColor,
      fontWeight: FontWeight.w400,
      fontSize: (currentThemeConfiguration.maxFontSize / 1.2) * .65,
      decorationColor: currentThemeConfiguration.textColor,
    );

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final RenderBox? renderBox = autoSizeTextKey.currentContext?.findRenderObject() as RenderBox?;
    //   _textRect = (renderBox?.localToGlobal(Offset.zero) ?? Offset.zero) & (renderBox?.size ?? Size.zero);
    // });

    setSafeAreaRect(context);
  }
  late final QuoteModel quoteModel;
  late final BuildContext context;

  int? _selectedBottomButtonIndex;

  int? get selectedBottomButtonIndex => _selectedBottomButtonIndex;

  void setSelectedBottomButtonIndex(int? index) {
    _selectedBottomButtonIndex = index;
    notifyListeners();
  }

  Future<void> updateThemeConfiguration({required ThemeConfigurationModel model}) async {
    await _themeConfigurationService.changeThemeConfiguration(model: model);
  }

  double _textOffset = -.6;

  double get textOffset => _textOffset;

  void setTextOffset(double offset) {
    _textOffset = offset;
    notifyListeners();
  }

  //             final Rect widgetRect = (renderBox?.localToGlobal(Offset.zero) ?? Offset.zero) & (renderBox?.size ?? Size.zero);
  Rect? _textRect;

  Rect? get textRect => _textRect;

  void setTextRect(Rect? rect) {
    _textRect = rect;
    notifyListeners();
  }

  Rect? _textFinalRect;

  Rect? get finalTextRect => _textFinalRect;

  void setFinalTextRect(Rect rect) {
    _textFinalRect = rect;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeConfigurationService,
      ];
}
