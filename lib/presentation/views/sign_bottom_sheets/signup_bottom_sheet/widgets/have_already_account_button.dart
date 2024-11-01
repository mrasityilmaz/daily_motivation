part of '../signup_bottom_sheet.dart';

@immutable
final class _HaveAlreadyAccountButton extends StatelessWidget {
  const _HaveAlreadyAccountButton();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.sign_already_have_account.tr(),
        style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.6)),
        children: [
          const TextSpan(text: '\t\t'),
          TextSpan(
            text: LocaleKeys.sign_sign_in.tr(),
            style: context.textTheme.bodyMedium?.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // Close the bottom sheet
                await locator<AppRouter>().maybePop();
                if (context.mounted) {
                  await const LoginBottomSheet().showAsModalBottomSheet<void>(context);
                }
              },
          ),
        ],
      ),
    );
  }
}
