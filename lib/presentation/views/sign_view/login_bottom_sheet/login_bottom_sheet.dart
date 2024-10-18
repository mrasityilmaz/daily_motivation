import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/validator_extension.dart';
import 'package:quotely/presentation/components/viewmodel_draggable_sheet.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:stacked/stacked.dart';

@immutable
final class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginBottomSheetViewModel>.nonReactive(
      viewModelBuilder: LoginBottomSheetViewModel.new,
      builder: (context, viewModel, child) {
        return ViewModelDraggableSheet<LoginBottomSheetViewModel>(
          body: Scaffold(
            body: Column(
              children: [
                CustomTextFormFieldWidget(
                  controller: viewModel.emailController,
                  // verticalTextAlign: TextAlignVertical.top,
                  hintText: 'Email',
                  maxLines: null,
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    return value.validateEmail;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class LoginBottomSheetViewModel extends BaseViewModel {
  LoginBottomSheetViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
