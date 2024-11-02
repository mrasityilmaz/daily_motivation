import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/sheets/templates/information_sheet_template/sheet_template.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

/// This sheet is shown when the user's account is ready.
/// If the user's email is not verified, it shows the email verification info.
@immutable
final class AccountReadySheet extends StatelessSheetableWidget {
  const AccountReadySheet({
    required this.showEmailVerificationInfo,
    super.key,
  }) : super(primary: false);
  final bool showEmailVerificationInfo;

  @override
  Widget build(BuildContext context) {
    return InformationSheetTemplate(
      title: Text(
        LocaleKeys.account_account_ready_title.tr(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      icon: Icon(
        Ionicons.checkmark_circle_outline,
        size: kMinInteractiveDimension * 1.5,
        color: Theme.of(context).colorScheme.primary,
      ),
      subtitle: () {
        if (showEmailVerificationInfo) {
          return const _EmailVerificationInfo();
        }
        return const SizedBox();
      }(),
    );
  }

  @override
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) {
    return Sheets(
      child: this,
      closeProgressThreshold: .5,
    ).showBottomSheet(
      context,
    );
  }
}

@immutable
final class _EmailVerificationInfo extends StatelessWidget {
  const _EmailVerificationInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.account_verify_email.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.6),
              ),
        ),
        const Gap.highHeight() * 2,
        Text.rich(
          TextSpan(
            text: LocaleKeys.account_dont_receive_email.tr(),
            children: [
              const TextSpan(text: '\r'),
              TextSpan(
                text: LocaleKeys.account_resend.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO : Implement this
                    // locator<AuthService>().sendEmailVerification();
                  },
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.7),
              ),
        ),
      ],
    );
  }
}
