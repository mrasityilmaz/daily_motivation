part of '../login_view.dart';

@immutable
final class _EmailTextField extends ViewModelWidget<LoginViewModel> {
  const _EmailTextField() : super(reactive: false); // not-reactive

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return CustomTextFormFieldWidget(
      controller: viewModel.emailController,
      hintText: 'Email',
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
      hintText: 'Password',
      textInputType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.none,
      isObscureText: true,
      validator: (value) {
        return value.validatePassword;
      },
    );
  }
}
