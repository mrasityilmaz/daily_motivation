part of '../signup_bottom_sheet.dart';

@immutable
final class _FormSection extends ViewModelWidget<SignUpViewModel> {
  const _FormSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Padding(
        padding: PaddingConstants.adaptiveScreenPadding(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap.normalHeight(),
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
