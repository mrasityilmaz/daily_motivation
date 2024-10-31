import 'package:flutter/material.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:stacked/stacked.dart';

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
