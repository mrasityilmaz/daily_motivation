// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/shared/theme/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.validator,
    super.key,
    this.autofillHints,
    this.textStyle,
    this.hintTextStyle,
    this.textColor,
    this.labelTextColor,
    this.isFill = true,
    this.fillColor,
    this.isDense,
    this.hintTextAlign,
    this.isObscureText,
    this.enabled,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.maxLength = 500,
    this.onTapOutside,
    this.readOnly,
    this.expands,
    this.contentPad,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.enableInteractiveSelection,
    this.inputFormatter,
    this.autoCorrect,
    this.onSubmitted,
    this.textInputAction,
    this.textInputType,
    this.textCapitalization,
    this.verticalTextAlign = TextAlignVertical.center,
  })  : borderColor = AppColorScheme.instance.surfaceColor.withOpacity(.5),
        hintTextColor = AppColorScheme.instance.surfaceColor;

  final String? Function(String?) validator;
  final Iterable<String>? autofillHints;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;

  final Color? textColor;
  final Color? hintTextColor;

  final Color? labelTextColor;
  final bool? isFill;
  final Color? fillColor;
  final Color? borderColor;
  final bool? isDense;

  final TextAlign? hintTextAlign;
  final TextAlignVertical verticalTextAlign;

  final bool? isObscureText;

  final bool? enabled;
  final void Function(String)? onChanged;

  final void Function()? onTap;
  final int? maxLines;
  final int maxLength;

  final void Function()? onTapOutside;

  final bool? readOnly;
  final bool? expands;

  final EdgeInsetsGeometry? contentPad;
  final BorderRadius? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatter;
  final bool? autoCorrect;

  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    final isObscured = ValueNotifier<bool>(isObscureText ?? false);
    return ValueListenableBuilder(
      valueListenable: isObscured,
      builder: (BuildContext context, bool obscuredValue, Widget? child) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          autofillHints: autofillHints,
          autocorrect: autoCorrect == true,
          controller: controller,
          enabled: enabled,
          enableInteractiveSelection: enableInteractiveSelection,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          maxLength: maxLength,
          maxLines: expands == true ? null : maxLines,
          minLines: expands == true ? null : 1,
          expands: expands == true,
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          onTap: onTap,
          obscureText: obscuredValue,
          obscuringCharacter: '*',
          onFieldSubmitted: onSubmitted,
          onTapOutside: (event) {
            if (onTapOutside != null) {
              onTapOutside!();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();

              SystemChannels.textInput.invokeMethod('TextInput.hide');
            }
          },
          style: textStyle ?? context.textTheme.titleMedium?.copyWith(color: textColor, fontWeight: FontWeight.w500),
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          textInputAction: textInputAction ?? TextInputAction.next,
          textAlign: hintTextAlign ?? TextAlign.start,
          textAlignVertical: verticalTextAlign,
          decoration: InputDecoration(
            filled: isFill,
            isDense: isDense,
            fillColor: fillColor,
            contentPadding: contentPad ?? (const EdgeInsets.symmetric(horizontal: 12, vertical: 16)),
            counterText: expands == true ? null : '',
            isCollapsed: true,
            //    hintText: hintText,
            hintStyle: hintTextStyle ?? context.textTheme.titleMedium?.copyWith(color: hintTextColor),
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? context.radius12.resolve(TextDirection.ltr),
              borderSide: BorderSide(color: borderColor ?? context.colors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? context.radius12.resolve(TextDirection.ltr),
              borderSide: BorderSide(color: borderColor ?? context.colors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? context.radius12.resolve(TextDirection.ltr),
              borderSide: BorderSide(color: context.colors.primary),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? context.radius12.resolve(TextDirection.ltr),
              borderSide: BorderSide(color: borderColor ?? context.colors.primary),
            ),
            labelText: hintText,
            labelStyle: hintTextStyle ?? context.textTheme.titleMedium?.copyWith(color: hintTextColor),

            floatingLabelStyle: hintTextStyle?.copyWith(color: context.colors.primary) ??
                context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.primary,
                ),
            floatingLabelAlignment: FloatingLabelAlignment.start,

            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(),
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: suffixIcon == null && isObscureText == true
                ? Padding(
                    padding: context.paddingLowRight * .5,
                    child: AdvancedButtonWidget.icon(
                      backgroundColor: Colors.transparent,
                      icon: Icon(
                        obscuredValue ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                        color: hintTextColor ?? context.colors.onBackground.withOpacity(.6),
                      ),
                      onPressed: () {
                        isObscured.value = !isObscured.value;
                      },
                    ),
                  )
                : suffixIcon,

            enabled: enabled ?? true,
          ),
        );
      },
    );
  }
}
