import 'package:flutter/material.dart';

final class LockOverlayDialog {
  factory LockOverlayDialog() => instance;

  LockOverlayDialog._internal();
  static final LockOverlayDialog instance = LockOverlayDialog._internal();
  static bool haveOverlay = false;
  final ValueNotifier<OverlayEntry?> _overlayEntry = ValueNotifier(null);

  void showCustomOverlay(
    BuildContext context, {
    required Widget child,
    bool forceOverlay = false,
  }) {
    if (forceOverlay) closeOverlay();
    if (haveOverlay) return;

    final OverlayState? overlayState = Navigator.of(context).overlay;
    if (overlayState == null) return;

    final myoverlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return child;
      },
    );

    _overlayEntry.value = myoverlayEntry;

    overlayState.insert(_overlayEntry.value!);
    haveOverlay = true;
  }

  void closeOverlay() {
    if (_overlayEntry.value == null) return;
    haveOverlay = false;
    _overlayEntry.value!.remove();
    _overlayEntry.value = null;
  }
}
