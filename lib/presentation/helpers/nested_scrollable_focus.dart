import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// For example : Look at the LoginView or SignUpView
mixin NestedScrollableFocus on BaseViewModel {
  ScrollController? get nestedScrollController;
  List<FocusNode> get focusNodes;

  bool get _anyTextFieldFocused => focusNodes.any((focusNode) => focusNode.hasFocus);

  void initFocusListener() {
    for (final focusNode in focusNodes) {
      focusNode.addListener(_focusListener);
    }
  }

  Future<void> _focusListener() async {
    if (_anyTextFieldFocused && nestedScrollController != null) {
      await openSliverAppBar();
    } else {
      await closeSliverAppBar();
    }
  }

  Future<void> openSliverAppBar() async {
    if (!nestedScrollController!.hasClients) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await nestedScrollController!.animateTo(
        nestedScrollController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  Future<void> closeSliverAppBar() async {
    if (!nestedScrollController!.hasClients) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await nestedScrollController!.animateTo(
        nestedScrollController!.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    for (final focusNode in focusNodes) {
      focusNode.removeListener(_focusListener);
    }
    super.dispose();
  }
}
