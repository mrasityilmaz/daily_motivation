part of '../app_sheets.dart';

abstract class _IBaseSheets {
  const _IBaseSheets({
    required this.child,
    this.isDismissible = true,
    this.enableDrag = true,
    this.useRootNavigator = false,
    this.bounce = true,
    this.expand = false,
    this.animationCurve = Curves.fastLinearToSlowEaseIn,
    this.duration = const Duration(milliseconds: 250),
    this.backgroundColor,
    this.elevation,
    this.shape = const RoundedRectangleBorder(
      borderRadius: RadiusConstants.highTop(),
    ),
    this.clipBehavior,
    this.barrierColor,
    this.secondAnimation,
    this.settings,
    this.closeProgressThreshold,
    this.constraints,
  });

  final Widget child;
  final bool isDismissible;
  final bool enableDrag;
  final bool useRootNavigator;
  final bool bounce;
  final bool expand;
  final Curve animationCurve;
  final Duration duration;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder shape;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final AnimationController? secondAnimation;
  final RouteSettings? settings;
  final double? closeProgressThreshold;
  final BoxConstraints? constraints;

  /// This builder using for create the pre-conditional widgets for the sheet.
  @protected
  Widget builderWithChildForSheet(BuildContext context);

  /// It's using for show the bottom sheet.
  Future<T?> showBottomSheet<T>(BuildContext context);

  /// It's using for show the bottom sheet as a route.
  ModalSheetRoute<T> createSheetRoute<T>(BuildContext context);
}
