part of '../signup_view.dart';

@immutable
final class _HaveAlreadyAccountButton extends StatelessWidget {
  const _HaveAlreadyAccountButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(
        MediaQuery.viewPaddingOf(context).bottom,
      ),
      child: Text.rich(
        TextSpan(
          text: LocaleKeys.sign_already_have_account.tr(),
          style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.6)),
          children: [
            const TextSpan(text: '\t\t'),
            TextSpan(
              text: LocaleKeys.sign_sign_in.tr(),
              style: context.textTheme.bodyMedium?.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // locator<AppRouter>().pushAndPopUntil(
                  //   const LoginViewRoute(),
                  //   predicate: (route) => false,
                  // );
                },
            ),
          ],
        ),
      ),
    );
  }
}
