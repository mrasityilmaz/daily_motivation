// ignore_for_file: empty_catches

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/base_loading_indicator_widget.dart';

final class OverlayDialog {
  factory OverlayDialog() => _instance ??= const OverlayDialog._();
  const OverlayDialog._();
  static OverlayDialog? _instance;

  // Check if overlay is currently displayed
  static bool _haveOverlay = false;

  // Overlay entry
  static OverlayEntry? _overlayEntry;

  /// This method will show a progress overlay while the asyncProcess is running.
  /// The overlay will be closed when the asyncProcess is done.
  ///
  /// params:
  /// - Future<T> Function() `asyncProcess` - The async process to run
  /// - bool `forceOverlay` - If true, the overlay will be shown even if there is already an overlay displayed
  /// - Widget? `progressWidget` - The widget to show as the progress indicator (default is a [BaseLoadingIndicator])
  ///
  Future<T?> showProgressOverlay<T>(
    BuildContext context, {
    required Future<T> Function() asyncProcess,
    bool forceOverlay = true,
    Widget? progressWidget,
  }) async {
    if (_haveOverlay && !forceOverlay) return null;

    final OverlayState overlayState = Overlay.of(context);
    if (forceOverlay) closeOverlay();

    final overlayEntry = OverlayEntry(
      builder: (BuildContext ctx) => BaseLoadingIndicator(
        progressWidget: progressWidget,
      ),
    );

    _overlayEntry = overlayEntry;
    overlayState.insert(_overlayEntry!);
    _haveOverlay = true;

    try {
      return await asyncProcess().then((result) => result);
    } catch (e) {
      rethrow;
    } finally {
      closeOverlay();
    }
  }

  /// This method will show an overlay with a progress indicator
  /// bool `show` - If true, the overlay will be shown. If false, the overlay will be closed
  ///
  void showOverlay(
    BuildContext context, {
    required bool show,
    Widget? progressWidget,
  }) {
    try {
      if (_haveOverlay && !show) {
        closeOverlay();
        return;
      }

      final OverlayState overlayState = Overlay.of(context);
      final overlayEntry = OverlayEntry(
        builder: (BuildContext ctx) => BaseLoadingIndicator(
          progressWidget: progressWidget,
        ),
      );

      _overlayEntry = overlayEntry;
      overlayState.insert(_overlayEntry!);
      _haveOverlay = true;
    } finally {
      closeOverlay();
    }
  }

  /// This method will close the overlay if it is currently displayed
  /// If the overlay is not displayed, this method will do nothing
  void closeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    _haveOverlay = false;
  }
}
