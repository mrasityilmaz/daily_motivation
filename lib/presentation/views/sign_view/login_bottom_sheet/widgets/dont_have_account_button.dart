part of '../login_view.dart';

@immutable
final class _DontHaveAnAccountButton extends StatelessWidget {
  const _DontHaveAnAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom),
      child: Text.rich(
        TextSpan(
          text: "Don't have an account?\t\t",
          style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.6)),
          children: [
            TextSpan(
              text: 'Register',
              style: context.textTheme.bodyMedium?.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
