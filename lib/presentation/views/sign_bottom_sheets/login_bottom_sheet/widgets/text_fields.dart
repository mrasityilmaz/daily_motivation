part of '../login_bottom_sheet.dart';

@immutable
final class _EmailTextField extends ViewModelWidget<LoginViewModel> {
  const _EmailTextField() : super(reactive: false); // not-reactive

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return CustomTextFormFieldWidget(
      controller: viewModel.emailController,
      focusNode: viewModel.emailFocusNode,
      hintText: LocaleKeys.sign_email.tr(),
      maxLines: null,
      textInputType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        return value.validateEmail;
      },
    );
  }
}

@immutable
final class _PasswordTextField extends ViewModelWidget<LoginViewModel> {
  const _PasswordTextField() : super(reactive: false); // not-reactive

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return CustomTextFormFieldWidget(
      controller: viewModel.passwordController,
      focusNode: viewModel.passwordFocusNode,
      hintText: LocaleKeys.sign_password.tr(),
      textInputType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.none,
      isObscureText: true,
      validator: (value) {
        return value.validatePassword;
      },
    );
  }
}
