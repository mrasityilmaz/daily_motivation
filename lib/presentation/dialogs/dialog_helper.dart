import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

part 'prepared_dialogs/watch_ad_or_buy_premium_dialog.dart';

final class DialogHelper with _ShowAdOrBuyPremiumDialogHelper {
  const DialogHelper._();

  ///
  /// Custom Progress Show Dialog Function
  ///
  static Future<T?> showDialog<T>(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
    Alignment alignment = Alignment.center,
    Color? barrierColor,
    bool closeOverlay = true,
  }) async {
    if (closeOverlay) {
      OverlayDialog().closeOverlay();
    }

    return showAnimatedDialog<T?>(
      context: context,
      duration: Durations.medium4,
      animationType: DialogTransitionType.scale,
      curve: Curves.ease,
      alignment: alignment,
      barrierColor: barrierColor ?? context.colors.scrim.withOpacity(.4),
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  static Future<TimeOfDay?> showAdaptiveTimePicker(BuildContext context, {required TimeOfDay initialTime}) async {
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
              actionsPadding: const PaddingConstants.allLow() * 1.2,
              shape: const RoundedRectangleBorder(
                borderRadius: RadiusConstants.allNormal(),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton.text(
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

  static Future<void> showBasicFlushBar(
    BuildContext context, {
    required String message,
    Duration? duration,
    void Function()? onPressed,
  }) async {
    final Flushbar<void> flushbar = Flushbar<void>(
      key: ValueKey('basic_flushbar_${context.hashCode}'),
      onTap: (flushbar) async {
        await flushbar.dismiss();
        onPressed?.call();
      },
      title: '',
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: context.textTheme.titleSmall?.copyWith(color: context.colors.surface, fontWeight: FontWeight.w600),
      ),
      duration: duration ?? const Duration(seconds: 2),
      animationDuration:
          duration != null ? Duration(milliseconds: duration.inMilliseconds ~/ 4) : const Duration(milliseconds: 250),
      forwardAnimationCurve: Curves.ease,
      backgroundColor: context.colors.surfaceTint,
      reverseAnimationCurve: Curves.ease,
      padding: const PaddingConstants.screenPaddingHorizontal() +
          const PaddingConstants.screenPaddingBottom() +
          const PaddingConstants.screenPaddingTop() * .5,
      margin:
          const PaddingConstants.screenPaddingHorizontal() * 2 + PaddingConstants.adaptiveScreenPaddingBottom(context),
      borderRadius: BorderRadius.circular(10),
    );

    await flushbar.show(context);
  }

  /// Show Watch Ad or Buy Premium Dialog
  ///
  /// This function is used to show a dialog that asks the user to watch an ad or buy premium.
  ///
  /// `context` is the current context.
  /// `params` is the parameters for the dialog.
  ///
  static Future<void> showWatchAdOrBuyPremiumDialog(
    BuildContext context, {
    required WatchAdOrBuyPremiumDialogParams params,
  }) async =>
      _ShowAdOrBuyPremiumDialogHelper.showWatchAdOrBuyPremiumDialog(
        context,
        params: params,
      );
}
