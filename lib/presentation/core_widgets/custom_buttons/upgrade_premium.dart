import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quotely/assets.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/button_styles.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

@immutable
final class UpgradePremiumButton extends StatelessWidget {
  const UpgradePremiumButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: CustomButtonStyles.standart(expand: true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.crow_front_premium_png,
            width: 32,
            height: 32,
          ),
          const Gap.mediumWidth(),
          Text(
            LocaleKeys.premium_upgrade_premium.tr(),
            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap.mediumWidth(),
        ],
      ),
    );
  }
}
