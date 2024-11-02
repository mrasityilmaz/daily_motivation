import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/upgrade_premium.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';

@immutable
final class ShowOrPayDialogBody extends StatelessWidget {
  const ShowOrPayDialogBody({
    required this.icon,
    required this.title,
    required this.watchAdPressed,
    required this.watchAdText,
    this.onlyWatchAd = false,
    super.key,
  });

  /// The dialog only show the watch ad button if this is true.
  final bool onlyWatchAd;

  /// The icon to show in main content of the dialog.
  final Icon icon;

  /// The title to show in main content of the dialog.
  /// default value is "LocaleKeys.watch_ad_to_unlock.tr()"
  final String title;

  /// The text to show in the watch ad button.
  /// default value is "LocaleKeys.watch_ad.tr()"
  final String watchAdText;

  /// The callback to call when the watch ad button is pressed.
  final VoidCallback watchAdPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      backgroundColor: context.colors.surface,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: RadiusConstants.allMedium(),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.width * .75,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const PaddingConstants.allLow() * .5,
                    child: CustomButton(
                      onPressed: () {
                        locator<AppRouter>().maybePop();
                      },
                      backgroundColor: context.colors.onSurface.withOpacity(.1),
                      child: const Icon(Icons.close_rounded),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const PaddingConstants.screenPaddingTop() +
                        const PaddingConstants.allLow() +
                        const PaddingConstants.normalTop() * 2,
                    child: icon,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const PaddingConstants.allLow(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const PaddingConstants.mediumVertical(),
                    child: AutoSizeText(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxFontSize: context.textTheme.titleMedium!.fontSize!,
                      minFontSize: 10,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomButton.outlinedText(
                    expand: true,
                    text: watchAdText,
                    onPressed: watchAdPressed,
                    backgroundColor: Color.lerp(context.colors.primary, context.colors.shadow, .55),
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (!onlyWatchAd) ...[
                    const Gap.lowHeight(),
                    UpgradePremiumButton(
                      crownDimension: 26,
                      textStyle: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      onPressed: () {
                        locator<AppRouter>().maybePop();
                        //TODO: Implement Upgrade Premium Button
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
