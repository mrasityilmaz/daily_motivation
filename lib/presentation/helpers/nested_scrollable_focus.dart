import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/presentation/core_widgets/slivers/header_sliver_appbar.dart';
import 'package:stacked/stacked.dart';

/// For example : Look at the LoginView or SignUpView
/// It's useful with [NestedScrollView] and [HeaderSliverAppBarWidget]
mixin NestedScrollableFocus on BaseViewModel {
  /// The nested scroll controller that is used to control the scroll of the nested scroll view
  ///
  /// Whenever any text field is focused, the nested scroll view will scroll to collapse the app bar
  ///
  /// Whenever no text field is focused, the nested scroll view will scroll to expand the app bar
  ///
  /// This is useful when the app bar is a sliver app bar
  /// #### Do not dispose this controller in the view model, it will be disposed automatically from [ModalScrollController]
  ScrollController? get nestedScrollController;

  /// The focus nodes that are used to listen to the focus changes
  ///
  List<FocusNode> get focusNodes;

  /// The listener that listens to the focus changes of the text fields
  /// any textFields are focused, the nested scroll view will scroll...
  bool get _anyTextFieldFocused => focusNodes.any((focusNode) => focusNode.hasFocus);

  /// Initializes the focus listener
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

  /// Opens the sliver app bar
  /// to open the sliver app bar when the text field is focused
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

  /// Closes the sliver app bar
  /// to close the sliver app bar when the text field is not focused
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
