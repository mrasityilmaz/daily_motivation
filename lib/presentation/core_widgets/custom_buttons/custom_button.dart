import 'package:flutter/material.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/button_styles.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/shared/app_theme.dart';

abstract class ICustomButtonInterface extends ElevatedButton {
  const ICustomButtonInterface({
    required super.onPressed,
    required super.child,
    super.key,
    this.expand = false,
    super.style,
    this.backgroundColor,
    this.padding = const PaddingConstants.allLow(),
  });

  final bool expand;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
}

@immutable
final class CustomButton extends ICustomButtonInterface {
  CustomButton({
    required super.onPressed,
    required super.child,
    super.key,
    super.expand,
    super.backgroundColor,
    super.padding,
    ButtonStyle? style,
  }) : super(
          style: CustomButtonStyles.standart(expand: expand).merge(style).copyWith(
                backgroundColor: backgroundColor != null ? WidgetStatePropertyAll(backgroundColor) : null,
                padding: WidgetStatePropertyAll(padding),
              ),
        );

  CustomButton.outlined({
    required super.onPressed,
    required super.child,
    super.key,
    super.expand,
    super.backgroundColor,
    super.padding,
    ButtonStyle? style,
  }) : super(
          style: CustomButtonStyles.outlined(expand: expand).merge(style).copyWith(
                backgroundColor: backgroundColor != null ? WidgetStatePropertyAll(backgroundColor) : null,
                padding: WidgetStatePropertyAll(padding),
              ),
        );

  CustomButton.text({
    required super.onPressed,
    required String text,
    TextStyle? textStyle,
    Color? textColor,
    super.backgroundColor = Colors.transparent,
    super.padding,
    super.key,
    super.expand,
    ButtonStyle? style,
  }) : super(
          child: Text(
            text,
            style: AppThemeManager.instance.textTheme.bodyMedium?.merge(textStyle).copyWith(color: textColor),
          ),
          style: CustomButtonStyles.standart(expand: expand).merge(style).copyWith(
                backgroundColor: WidgetStatePropertyAll(backgroundColor),
                padding: WidgetStatePropertyAll(padding),
              ),
        );
  CustomButton.outlinedText({
    required super.onPressed,
    required String text,
    TextStyle? textStyle,
    Color? textColor,
    super.backgroundColor,
    super.padding,
    super.key,
    super.expand,
    ButtonStyle? style,
  }) : super(
          child: Text(
            text,
            style: AppThemeManager.instance.textTheme.bodyMedium?.merge(textStyle).copyWith(color: textColor),
          ),
          style: CustomButtonStyles.outlined(expand: expand).merge(style).copyWith(
                backgroundColor: backgroundColor != null ? WidgetStatePropertyAll(backgroundColor) : null,
                padding: WidgetStatePropertyAll(padding),
              ),
        );
}
