part of '../login_bottom_sheet.dart';

@immutable
final class _GoogleSignButton extends ViewModelWidget<LoginViewModel> {
  const _GoogleSignButton() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return CustomButton(
      onPressed: () async => viewModel.signWithGoogle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Ionicons.logo_google, color: IconTheme.of(context).color),
          const Gap.lowWidth(),
          Text(
            LocaleKeys.sign_sign_in_with_google.tr(),
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

@immutable
final class _AppleSignButton extends ViewModelWidget<LoginViewModel> {
  const _AppleSignButton() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return CustomButton(
      onPressed: () async => viewModel.signWithApple(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Ionicons.logo_apple, color: IconTheme.of(context).color),
          const Gap.lowWidth(),
          Text(
            LocaleKeys.sign_sign_in_with_apple.tr(),
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
