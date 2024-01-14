import 'dart:async';

import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/dialogs/lock_overlay_dialog.dart';
import 'package:daily_motivation/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

final class AppDialogs {
  factory AppDialogs() => instance;

  const AppDialogs._internal();
  static const AppDialogs instance = AppDialogs._internal();

  ///
  /// Custom Success or Failure Dialog
  ///

  Future<T?> showModalBottomSheetDialog<T>(
    BuildContext? context, {
    required Widget child,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) async {
    final BuildContext ctx = context ?? locator<AppRouter>().navigatorKey.currentContext!;
    return showModalBottomSheet<T>(
      context: ctx,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? ctx.colors.primary,
      barrierColor: barrierColor ?? ctx.colors.onBackground.withOpacity(.3),
      barrierLabel: barrierLabel,
      clipBehavior: clipBehavior,
      constraints: constraints,
      elevation: elevation,
      routeSettings: routeSettings,
      shape: shape,
      transitionAnimationController: transitionAnimationController,
      useSafeArea: useSafeArea,
      anchorPoint: anchorPoint,
      showDragHandle: showDragHandle,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  ///
  /// Custom Progress Show Dialog Function
  ///

  FutureOr<T?> showDialog<T>(BuildContext context, {required Widget child, bool barrierDismissible = true, Alignment alignment = Alignment.center, Color? barrierColor}) async {
    ProgressOverlayDialog.instance.closeOverlay();
    LockOverlayDialog.instance.closeOverlay();

    return showAnimatedDialog<T?>(
      context: context,
      duration: const Duration(milliseconds: 400),
      animationType: DialogTransitionType.scale,
      curve: Curves.easeInOutExpo,
      alignment: alignment,
      barrierColor: barrierColor ?? context.colors.scrim.withOpacity(.4),
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }
}
