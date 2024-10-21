import 'package:flutter/material.dart';
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
  const Gap.tinyHeight({super.key})
      : super(
          child: const SizedBox(),
          height: SizeConstants.tiny,
        );

  const Gap.lowHeight({super.key})
      : super(
          child: const SizedBox(),
          height: SizeConstants.low,
        );

  const Gap.normalHeight({super.key})
      : super(
          child: const SizedBox(),
          height: SizeConstants.normal,
        );

  const Gap.mediumHeight({super.key})
      : super(
          child: const SizedBox(),
          height: SizeConstants.medium,
        );

  const Gap.highHeight({super.key})
      : super(
          child: const SizedBox(),
          height: SizeConstants.high,
        );

  // Width
  const Gap.tinyWidth({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.tiny,
        );

  const Gap.lowWidth({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.low,
        );

  const Gap.normalWidth({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.normal,
        );

  const Gap.mediumWidth({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.medium,
        );

  const Gap.highWidth({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.high,
        );

  // Both
  const Gap.tinyAll({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.tiny,
          height: SizeConstants.tiny,
        );

  const Gap.lowAll({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.low,
          height: SizeConstants.low,
        );

  const Gap.normalAll({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.normal,
          height: SizeConstants.normal,
        );

  const Gap.mediumAll({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.medium,
          height: SizeConstants.medium,
        );

  const Gap.highAll({super.key})
      : super(
          child: const SizedBox(),
          width: SizeConstants.high,
          height: SizeConstants.high,
        );
}
