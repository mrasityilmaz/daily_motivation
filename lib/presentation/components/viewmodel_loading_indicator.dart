import 'package:flutter/material.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/base_loading_indicator_widget.dart';
import 'package:stacked/stacked.dart';

/// A widget that shows a loading indicator when the viewmodel<T> is busy.
///
/// [progressWidget] is the widget that will be shown when the viewmodel is busy.
/// Default is [CircularProgressIndicator.adaptive].
///
/// [hasBackgroundColor] is a boolean that determines whether the loading indicator has a background color.
/// Default is `true`.
/// Also, [BaseLoadingIndicator] has a blurred background effect as default.
///
/// [isBusy] is a callback that will be called when the viewmodel is busy.
///
final class ViewModelLoadingIndicator<T extends BaseViewModel> extends SelectorViewModelWidget<T, bool> {
  const ViewModelLoadingIndicator({super.key, this.progressWidget, this.hasBackgroundColor = true, this.isBusy});

  final Widget? progressWidget;
  final bool hasBackgroundColor;
  final ValueChanged<bool>? isBusy;

  @override
  Widget build(
    BuildContext context,
    bool value,
  ) {
    if (value) {
      return BaseLoadingIndicator(
        progressWidget: progressWidget,
        hasBackgroundColor: hasBackgroundColor,
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  bool selector(T viewModel) {
    final bool busyState = viewModel.isBusy;
    this.isBusy?.call(busyState);
    return busyState;
  }
}
