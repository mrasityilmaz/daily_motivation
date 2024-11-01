part of '../login_bottom_sheet.dart';

@immutable
final class _DontHaveAnAccountButton extends StatelessWidget {
  const _DontHaveAnAccountButton();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
                await locator<AppRouter>().maybePop();
                if (context.mounted) {
                  await const SignUpBottomSheet().showAsModalBottomSheet<void>(context);
                }
              },
          ),
        ],
      ),
    );
  }
}
