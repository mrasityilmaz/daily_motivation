import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';

@immutable
final class ShowOrPayDialogBody extends StatelessWidget {
  const ShowOrPayDialogBody({
    required this.icon,
    required this.title,
    required this.firstButtonText,
    required this.firstButtonOnPressed,
    this.secondButtonText,
    this.secondButtonOnPressed,
    super.key,
  });
  final Icon icon;
  final String title;
  final String firstButtonText;
  final String? secondButtonText;
  final VoidCallback firstButtonOnPressed;
  final VoidCallback? secondButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      backgroundColor: context.colors.surface,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: context.radius16,
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
                        const PaddingConstants.normalTop(),
                    child: icon,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const PaddingConstants.screenPadding() * .8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const PaddingConstants.normalTop() + const PaddingConstants.lowBottom(),
                    child: AutoSizeText(
                      title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxFontSize: context.textTheme.titleMedium!.fontSize!,
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomButton.text(
                    expand: true,
                    text: firstButtonText,
                    onPressed: firstButtonOnPressed,
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (secondButtonText != null && secondButtonOnPressed != null) ...[
                    SizedBox(
                      height: context.lowValue,
                    ),
                    CustomButton.text(
                      expand: true,
                      text: secondButtonText!,
                      textStyle: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      onPressed: secondButtonOnPressed,
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
