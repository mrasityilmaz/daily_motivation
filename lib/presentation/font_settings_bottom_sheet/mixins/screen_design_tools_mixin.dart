part of '../font_settings_bottom_sheet.dart';

mixin ScreenDesignToolsMixin on BaseViewModel {
  late final Rect _safeAreaRect;

  Rect get safeAreaRect => _safeAreaRect;

  void setSafeAreaRect(BuildContext context) {
    final double screenHeight = context.mediaQuery.size.height;
    final double topPadding = context.mediaQuery.padding.bottom + (screenHeight * .15 * .5);

    final double leftPadding = context.screenPaddingHorizontal.left * .5;
    final double rightPadding = context.screenPaddingHorizontal.right * .5;

    _safeAreaRect = Rect.fromPoints(
      Offset(leftPadding, topPadding),
      Offset(context.width - rightPadding, screenHeight * .85),
    );
  }

  Rect? _finalRect;

  Rect? get finalRect => _finalRect;

  void setFinalRect(Rect? rect) {
    _finalRect = rect;
    notifyListeners();
  }
}
