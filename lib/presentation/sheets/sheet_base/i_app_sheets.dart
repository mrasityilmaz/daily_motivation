part of '../app_sheets.dart';

abstract class _IBaseSheets {
  const _IBaseSheets({
    required this.child,
    required this.isDismissible,
    required this.enableDrag,
    required this.useRootNavigator,
    required this.bounce,
    required this.expand,
    required this.animationCurve,
    required this.duration,
    required this.shape,
    required this.showDragHandle,
    this.backgroundColor,
    this.elevation,
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
  final bool showDragHandle;
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
}
