part of '../signup_view.dart';

@immutable
final class _EmailTextField extends ViewModelWidget<SignUpViewModel> {
  const _EmailTextField() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return CustomTextFormFieldWidget(
      focusNode: viewModel.emailFocusNode,
      controller: viewModel.emailController,
      validator: (p0) => p0.validateEmail,
      hintText: 'Email',
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
      hintText: 'Password',
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
      validator: (p0) {
        return p0.validatePassword ?? p0.validateConfirmPassword(viewModel.passwordController.text);
      },
      hintText: 'Password again',
      isObscureText: true,
      autofillHints: const [AutofillHints.newPassword],
      textCapitalization: TextCapitalization.none,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
