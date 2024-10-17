import 'package:flutter/material.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:stacked/stacked.dart';

@immutable
final class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginBottomSheetViewModel>.nonReactive(
      viewModelBuilder: LoginBottomSheetViewModel.new,
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: .8,
          builder: (context, scrollController) => PrimaryScrollController(
            controller: scrollController,
            child: const ClipRRect(
              borderRadius: RadiusConstants.mediumTop(),
              child: Stack(
                children: [
                  Scaffold(
                    body: Column(),
                  ),
                  ViewModelLoadingIndicator<LoginBottomSheetViewModel>(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final class LoginBottomSheetViewModel extends BaseViewModel {
  LoginBottomSheetViewModel();
}
