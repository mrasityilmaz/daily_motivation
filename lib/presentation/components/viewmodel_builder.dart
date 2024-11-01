import 'package:flutter/material.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:stacked/stacked.dart';

/// A widget that wraps a body with a loading indicator.
/// It's useful for showing a loading indicator when the viewmodel is busy.
///
/// Also the other components is [ViewModelLoadingIndicator] which is a widget that shows a loading indicator when the viewmodel is busy.
///
/// [body] is the widget that will be shown always.
///
@immutable
final class ViewModelBodyBuilder<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelBodyBuilder({required this.body, super.key});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        body,
        ViewModelLoadingIndicator<T>(),
      ],
    );
  }
}
