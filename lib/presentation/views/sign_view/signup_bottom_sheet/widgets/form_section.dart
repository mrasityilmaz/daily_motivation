part of '../signup_view.dart';

@immutable
final class _FormSection extends ViewModelWidget<SignUpViewModel> {
  const _FormSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.normalTop() * 1.5,
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            const _EmailTextField(),
            const Gap.mediumHeight(),
            const _PasswordTextField(),
            const Gap.mediumHeight(),
            const _ConfirmPasswordTextField(),
            const Gap.mediumHeight(),
            const Spacer(),
            CustomButton(
              expand: true,
              onPressed: () async => viewModel.signUpWithEmailAndPassword(),
              child: Text(
                LocaleKeys.sign_sign_up.tr(),
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Gap.mediumHeight(),
            const _HaveAlreadyAccountButton(),
          ],
        ),
      ),
    );
  }
}
