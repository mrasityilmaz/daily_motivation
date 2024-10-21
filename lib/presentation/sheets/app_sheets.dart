import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';

@immutable
final class Sheets {
  const Sheets._();

  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useRootNavigator = false,
    bool bounce = true,
    bool expand = false,
    Curve animationCurve = Curves.fastLinearToSlowEaseIn,
    Duration duration = const Duration(milliseconds: 250),
    Color? backgroundColor,
    double? elevation,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: RadiusConstants.highTop(),
    ),
    Clip? clipBehavior,
    Color? barrierColor,
    AnimationController? secondAnimation,
    RouteSettings? settings,
    double? closeProgressThreshold,
    BoxConstraints? constraints,
  }) async {
    return showMaterialModalBottomSheet<T>(
      context: context,
      builder: (context) {
        late Widget innerChild;

        innerChild = ConstrainedBox(
          constraints: constraints ??
              BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height - MediaQuery.viewPaddingOf(context).top),
          child: child,
        );

        if (shape is RoundedRectangleBorder) {
          innerChild = ClipRRect(
            borderRadius: shape.borderRadius,
            child: innerChild,
          );
        }

        return innerChild;
      },
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor ?? context.colors.scrim.withOpacity(0.5),
      bounce: bounce,
      expand: expand,
      secondAnimation: secondAnimation,
      animationCurve: animationCurve,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      duration: duration,
      settings: settings,
      closeProgressThreshold: closeProgressThreshold,
    );
  }
}
