import 'package:flutter/material.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:stacked/stacked.dart';

@immutable
final class ViewModelDraggableSheet<T extends BaseViewModel> extends DraggableScrollableSheet {
  ViewModelDraggableSheet({
    required this.body,
    super.key,
    super.initialChildSize = 0.8,
    super.minChildSize = 0.8,
    super.maxChildSize = 1.0,
    super.expand = true,
    super.snap = false,
    super.snapSizes,
    super.snapAnimationDuration,
    super.controller,
    super.shouldCloseOnMinExtent = true,
  }) : super(
          builder: (context, scrollController) => PrimaryScrollController(
            controller: scrollController,
            child: ClipRRect(
              borderRadius: const RadiusConstants.mediumTop(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  body,
                  ViewModelLoadingIndicator<T>(),
                ],
              ),
            ),
          ),
        );

  //
  final Scaffold body;
}
