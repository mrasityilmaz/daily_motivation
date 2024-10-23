part of '../login_view.dart';

@immutable
final class _DontHaveAnAccountButton extends StatelessWidget {
  const _DontHaveAnAccountButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom),
      child: Text.rich(
        TextSpan(
          text: LocaleKeys.sign_dont_have_account.tr(),
          style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.6)),
          children: [
            const TextSpan(text: '\t\t'),
            TextSpan(
              text: LocaleKeys.sign_sign_up.tr(),
              style: context.textTheme.bodyMedium?.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await const SignUpView().showAsModalBottomSheet<void>(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}
