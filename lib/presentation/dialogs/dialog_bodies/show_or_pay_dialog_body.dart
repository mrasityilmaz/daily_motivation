import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/navigator/app_navigator.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';

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
      elevation: 20,
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
                    padding: context.paddingLow * .5,
                    child: AdvancedButtonWidget.icon(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () {
                        locator<AppRouter>().pop();
                      },
                      backgroundColor: context.colors.onSurface.withOpacity(.1),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: context.screenPaddingTop + context.paddingLow + context.paddingNormalTop,
                    child: icon,
                  ),
                ),
              ],
            ),
            Padding(
              padding: context.screenPadding * .8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: context.paddingNormalTop + context.paddingLowBottom,
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
                  AdvancedButtonWidget.text(
                    expand: true,
                    bounceIt: true,
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
                    AdvancedButtonWidget.text(
                      expand: true,
                      bounceIt: true,
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
