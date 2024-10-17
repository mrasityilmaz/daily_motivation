part of 'theme_configuration_service.dart';

mixin _ScreenDesignToolsMixin {
  late final Rect _defaultRect;

  Rect get defaultRect => _defaultRect;

  void _setDefaultRect(BuildContext context) {
    _defaultRect = Rect.fromCenter(
      center: Offset(context.width * .5, _safeAreaRect.height * .45),
      width: _safeAreaRect.width,
      height: _safeAreaRect.height,
    );
  }

  /// A mixin that provides theme configuration service functionality.
  ///
  /// This mixin contains a method to set the safe area rectangle based on the
  /// provided [BuildContext]. It also exposes a getter to access the safe area
  /// rectangle.

  late final Rect _safeAreaRect;

  Rect get safeAreaRect => _safeAreaRect;

  /// Sets the safe area rectangle based on the provided [BuildContext].
  ///
  /// The safe area rectangle is calculated using the screen height, top padding,
  /// left padding, right padding, and screen width. The calculated rectangle is
  /// then assigned to the [_safeAreaRect] property.
  void setSafeAreaRect(BuildContext context) {
    final double screenHeight = context.mediaQuery.size.height;
    final double topPadding = context.mediaQuery.padding.bottom + (screenHeight * .15 * .5);

    final double leftPadding = const PaddingConstants.screenPaddingHorizontal().left * .5;
    final double rightPadding = const PaddingConstants.screenPaddingHorizontal().right * .5;

    _safeAreaRect = Rect.fromPoints(
      Offset(leftPadding, topPadding),
      Offset(context.width - rightPadding, screenHeight * .85),
    );

    _setDefaultRect(context);
  }
}
