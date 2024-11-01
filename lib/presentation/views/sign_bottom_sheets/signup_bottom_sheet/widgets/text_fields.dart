part of '../signup_bottom_sheet.dart';

@immutable
final class _EmailTextField extends ViewModelWidget<SignUpViewModel> {
  const _EmailTextField() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return CustomTextFormFieldWidget(
      focusNode: viewModel.emailFocusNode,
      controller: viewModel.emailController,
      validator: (p0) => p0.validateEmail,
      hintText: LocaleKeys.sign_email.tr(),
      autofillHints: const [AutofillHints.email],
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.emailAddress,
    );
  }
}

@immutable
final class _PasswordTextField extends ViewModelWidget<SignUpViewModel> {
  const _PasswordTextField() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return CustomTextFormFieldWidget(
      focusNode: viewModel.passwordFocusNode,
      controller: viewModel.passwordController,
      validator: (p0) => p0.validatePassword,
      hintText: LocaleKeys.sign_password.tr(),
      isObscureText: true,
      autofillHints: const [AutofillHints.newPassword],
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.visiblePassword,
    );
  }
}

@immutable
final class _ConfirmPasswordTextField extends ViewModelWidget<SignUpViewModel> {
  const _ConfirmPasswordTextField() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return CustomTextFormFieldWidget(
      focusNode: viewModel.rePasswordFocusNode,
      controller: viewModel.rePasswordController,
      hintText: LocaleKeys.sign_password_confirm.tr(),
      validator: (p0) {
        return p0.validatePassword ?? p0.validateConfirmPassword(viewModel.passwordController.text);
      },
      isObscureText: true,
      autofillHints: const [AutofillHints.newPassword],
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
