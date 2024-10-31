import 'package:flutter/material.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/base_loading_indicator_widget.dart';
import 'package:stacked/stacked.dart';

final class ViewModelLoadingIndicator<T extends BaseViewModel> extends SelectorViewModelWidget<T, bool> {
  const ViewModelLoadingIndicator({super.key, this.progressWidget, this.hasBackgroundColor = false, this.isBusy});

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
