import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotely/presentation/view_constants/size_constants.dart';

@immutable
final class Gap extends SizedBox {
  // ignore: unused_element
  const Gap._() : super();

  Gap.resizeAvoidBottomInset(BuildContext context, {super.key})
      : super(
          height: MediaQuery.viewInsetsOf(context).bottom,
        );

  /// default: `SizeConstants.normal`
  const Gap.H(double? value, {super.key})
      : super(
          height: value ?? SizeConstants.normal,
        );

  /// default: `SizeConstants.normal`
  const Gap.W(double? value, {super.key})
      : super(
          width: value ?? SizeConstants.normal,
        );

  // Height
  const Gap.tinyHeight({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          height: SizeConstants.tiny,
        );

  const Gap.lowHeight({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          height: SizeConstants.low,
        );

  const Gap.normalHeight({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          height: SizeConstants.normal,
        );

  const Gap.mediumHeight({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          height: SizeConstants.medium,
        );

  const Gap.highHeight({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          height: SizeConstants.high,
        );

  // Width
  const Gap.tinyWidth({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.tiny,
        );

  const Gap.lowWidth({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.low,
        );

  const Gap.normalWidth({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.normal,
        );

  const Gap.mediumWidth({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.medium,
        );

  const Gap.highWidth({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.high,
        );

  // Both
  const Gap.tinyAll({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.tiny,
          height: SizeConstants.tiny,
        );

  const Gap.lowAll({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.low,
          height: SizeConstants.low,
        );

  const Gap.normalAll({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.normal,
          height: SizeConstants.normal,
        );

  const Gap.mediumAll({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.medium,
          height: SizeConstants.medium,
        );

  const Gap.highAll({super.key, Widget child = const SizedBox()})
      : super(
          child: child,
          width: SizeConstants.high,
          height: SizeConstants.high,
        );
  @protected
  const Gap.copyWith({super.key, super.width, super.height, Widget child = const SizedBox()})
      : super(
          child: child,
        );
}

extension GapMultiplier on Gap {
  SizedBox operator *(double multiplier) {
    return Gap.copyWith(
      width: width != null ? width! * multiplier : null,
      height: height != null ? height! * multiplier : null,
      child: child ?? const SizedBox(),
    );
  }
}
