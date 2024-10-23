part of '../login_view.dart';

@immutable
final class _FormSection extends ViewModelWidget<LoginViewModel> {
  const _FormSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          const _EmailTextField(),
          const Gap.normalHeight(),
          const _PasswordTextField(),
          const Gap.normalHeight(),
          CustomButton(
            expand: true,
            onPressed: () async => viewModel.signWithEmailAndPassword(),
            child: Text(
              LocaleKeys.sign_sign_in.tr(),
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
