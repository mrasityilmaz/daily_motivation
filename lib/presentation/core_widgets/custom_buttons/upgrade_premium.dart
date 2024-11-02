import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quotely/assets.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/button_styles.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

@immutable
final class UpgradePremiumButton extends StatelessWidget {
  UpgradePremiumButton({required this.onPressed, super.key, this.crownDimension = 32, this.textStyle})
      : style = CustomButtonStyles.standart(expand: true);
  UpgradePremiumButton.outlined({required this.onPressed, super.key, this.crownDimension = 32, this.textStyle})
      : style = CustomButtonStyles.outlined(expand: true);

  final VoidCallback onPressed;
  final double crownDimension;
  final TextStyle? textStyle;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.crow_front_premium_png,
            width: crownDimension,
            height: crownDimension,
          ),
          const Gap.mediumWidth(),
          Text(
            LocaleKeys.premium_upgrade_premium.tr(),
            style: textStyle ?? context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap.mediumWidth(),
        ],
      ),
    );
  }
}
