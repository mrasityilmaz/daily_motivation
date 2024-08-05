import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/dialogs/lock_overlay_dialog.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';

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
      barrierColor: barrierColor ?? ctx.colors.onSurface.withOpacity(.3),
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

  Future<T?> showDialog<T>(BuildContext context, {required Widget child, bool barrierDismissible = true, Alignment alignment = Alignment.center, Color? barrierColor}) async {
    ProgressOverlayDialog.instance.closeOverlay();
    LockOverlayDialog.instance.closeOverlay();

    return showAnimatedDialog<T?>(
      context: context,
      duration: const Duration(milliseconds: 400),
      animationType: DialogTransitionType.scale,
      curve: Curves.ease,
      alignment: alignment,
      barrierColor: barrierColor ?? context.colors.scrim.withOpacity(.4),
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  Future<TimeOfDay?> showAdaptiveTimePicker(BuildContext context, {required TimeOfDay initialTime}) async {
    if (Platform.isAndroid) {
      return showTimePicker(
        context: context,
        initialTime: initialTime,
      );
    } else {
      TimeOfDay time = initialTime;
      final DateTime now = DateTime.now();

      final DateTime initialTime0 = DateTime(now.year, now.month, now.day, initialTime.hour, initialTime.minute);

      return showDialog(
        context,
        child: StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              alignment: Alignment.center,
              contentPadding: EdgeInsets.zero,
              actionsPadding: context.paddingLow * 1.2,
              shape: RoundedRectangleBorder(borderRadius: context.radius12),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: AdvancedButtonWidget.text(
                        text: 'OK',
                        onPressed: () {
                          Navigator.of(context).pop(time);
                        },
                        expand: true,
                      ),
                    ),
                  ],
                ),
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: context.height * .3,
                    width: context.width * .75,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CupertinoDatePicker(
                            initialDateTime: initialTime0,
                            use24hFormat: true,
                            onDateTimeChanged: (value) {
                              setState(() {
                                time = TimeOfDay.fromDateTime(value);
                              });
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }

  Future<void> showBasicFlushBar(BuildContext context, {required String message, Duration? duration}) async {
    await Flushbar<void>(
      title: '',
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: context.textTheme.titleSmall?.copyWith(color: context.colors.surface, fontWeight: FontWeight.w600),
      ),
      duration: duration ?? context.normalDuration,
      animationDuration: duration != null ? Duration(milliseconds: duration.inMilliseconds ~/ 4) : context.duration250,
      forwardAnimationCurve: Curves.ease,
      backgroundColor: context.colors.surfaceTint,
      reverseAnimationCurve: Curves.ease,
      padding: context.screenPaddingHorizontal + context.screenPaddingBottom + context.screenPaddingTop * .5,
      margin: context.screenPaddingHorizontal * 2 + context.adaptiveScreenPaddingBottom,
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }
}
