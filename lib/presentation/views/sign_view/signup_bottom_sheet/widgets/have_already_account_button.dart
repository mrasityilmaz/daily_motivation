part of '../signup_view.dart';

@immutable
final class _HaveAlreadyAccountButton extends StatelessWidget {
  const _HaveAlreadyAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(
        MediaQuery.viewPaddingOf(context).bottom,
      ),
      child: Text.rich(
        TextSpan(
          text: 'I have an account?\t\t',
          style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.6)),
          children: [
            TextSpan(
              text: 'Log In',
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
