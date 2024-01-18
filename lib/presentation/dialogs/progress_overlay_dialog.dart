// ignore_for_file: empty_catches

import 'dart:async';

import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/base_loading_indicator_widget.dart';
import 'package:flutter/material.dart';

final class ProgressOverlayDialog {
  factory ProgressOverlayDialog() => instance;

  ProgressOverlayDialog._internal();
  static final ProgressOverlayDialog instance = ProgressOverlayDialog._internal();
  static bool haveOverlay = false;
  static OverlayEntry? _overlayEntry;

  Future<T?> showProgressOverlay<T>(
    BuildContext context, {
    required Future<T> Function() asyncProcess,
    bool forceOverlay = true,
    Widget? progressWidget,
  }) async {
    if (forceOverlay) closeOverlay();
    if (haveOverlay) return null;

    final OverlayState overlayState = Overlay.of(context);

    final myoverlayEntry = OverlayEntry(
      builder: (BuildContext ctx) {
        return BaseLoadingIndicator(
          progressWidget: progressWidget,
        );
      },
    );

    _overlayEntry = myoverlayEntry;

    try {
      overlayState.insert(_overlayEntry!);
      haveOverlay = true;

      return await asyncProcess().then((v) {
        return v;
      });
    } catch (e) {
      debugPrint(e.toString());

      return null;
    } finally {
      closeOverlay();
    }
  }

  void closeOverlay() {
    try {
      if (_overlayEntry == null) {
        haveOverlay = false;
        return;
      } else {
        haveOverlay = false;
        _overlayEntry?.remove();
        _overlayEntry = null;
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
