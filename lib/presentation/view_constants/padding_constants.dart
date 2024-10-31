import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/size_constants.dart';

/// This class contains all the padding constants used in the app
///
// Thanks to @vb10 for the idea
///
/// ```dart
/// // tiny < low < normal < medium < high
/// SizeConstants.tiny = 4;
/// SizeConstants.low = 8;
/// SizeConstants.normal = low * 1.5;
/// SizeConstants.medium = low * 2;
/// SizeConstants.high = low * 2.5;
/// ```
@immutable
final class PaddingConstants extends EdgeInsets {
  // ignore: unused_element
  const PaddingConstants._() : super.all(0);

  const PaddingConstants.zero() : super.all(0);

  // Paddings All
  const PaddingConstants.all(super.value) : super.all();
  const PaddingConstants.allTiny() : super.all(tinyValue);
  const PaddingConstants.allLow() : super.all(lowValue);
  const PaddingConstants.allNormal() : super.all(normalValue);
  const PaddingConstants.allMedium() : super.all(mediumValue);
  const PaddingConstants.allHigh() : super.all(highValue);

  // Paddings Horizontal
  const PaddingConstants.horizontal(double value) : super.symmetric(horizontal: value);
  const PaddingConstants.tinyHorizontal() : super.symmetric(horizontal: tinyValue);
  const PaddingConstants.lowHorizontal() : super.symmetric(horizontal: lowValue);
  const PaddingConstants.normalHorizontal() : super.symmetric(horizontal: normalValue);
  const PaddingConstants.mediumHorizontal() : super.symmetric(horizontal: mediumValue);
  const PaddingConstants.highHorizontal() : super.symmetric(horizontal: highValue);

  // Paddings Vertical
  const PaddingConstants.vertical(double value) : super.symmetric(vertical: value);
  const PaddingConstants.tinyVertical() : super.symmetric(vertical: tinyValue);
  const PaddingConstants.lowVertical() : super.symmetric(vertical: lowValue);
  const PaddingConstants.normalVertical() : super.symmetric(vertical: normalValue);
  const PaddingConstants.mediumVertical() : super.symmetric(vertical: mediumValue);
  const PaddingConstants.highVertical() : super.symmetric(vertical: highValue);

  const PaddingConstants.tinyLeft() : super.only(left: tinyValue);
  const PaddingConstants.tinyRight() : super.only(right: tinyValue);
  const PaddingConstants.tinyTop() : super.only(top: tinyValue);
  const PaddingConstants.tinyBottom() : super.only(bottom: tinyValue);

  const PaddingConstants.lowLeft() : super.only(left: lowValue);
  const PaddingConstants.lowRight() : super.only(right: lowValue);
  const PaddingConstants.lowTop() : super.only(top: lowValue);
  const PaddingConstants.lowBottom() : super.only(bottom: lowValue);

  const PaddingConstants.normalLeft() : super.only(left: normalValue);
  const PaddingConstants.normalRight() : super.only(right: normalValue);
  const PaddingConstants.normalTop() : super.only(top: normalValue);
  const PaddingConstants.normalBottom() : super.only(bottom: normalValue);

  const PaddingConstants.mediumLeft() : super.only(left: mediumValue);
  const PaddingConstants.mediumRight() : super.only(right: mediumValue);
  const PaddingConstants.mediumTop() : super.only(top: mediumValue);
  const PaddingConstants.mediumBottom() : super.only(bottom: mediumValue);

  const PaddingConstants.highLeft() : super.only(left: highValue);
  const PaddingConstants.highRight() : super.only(right: highValue);
  const PaddingConstants.highTop() : super.only(top: highValue);
  const PaddingConstants.highBottom() : super.only(bottom: highValue);

  // Individual Paddings

  PaddingConstants.adaptiveScreenPaddingBottom(BuildContext context)
      : super.only(
          bottom: getAdaptiveViewPaddingBottom(context),
        );

  PaddingConstants.adaptiveScreenPaddingVertical(BuildContext context)
      : super.only(
          top: getAdaptiveViewPaddingBottom(context),
          bottom: getAdaptiveViewPaddingBottom(context),
        );

  PaddingConstants.adaptiveScreenPadding(BuildContext context)
      : super.only(
          left: mediumValue,
          right: mediumValue,
          top: normalValue,
          bottom: getAdaptiveViewPaddingBottom(context),
        );
  const PaddingConstants.screenPadding()
      : super.only(
          left: mediumValue,
          right: mediumValue,
          top: normalValue,
        );

  const PaddingConstants.screenPaddingLeft() : super.only(left: mediumValue);
  const PaddingConstants.screenPaddingRight() : super.only(right: mediumValue);
  const PaddingConstants.screenPaddingTop() : super.only(top: normalValue);
  const PaddingConstants.screenPaddingBottom() : super.only(bottom: normalValue);
  const PaddingConstants.screenPaddingVertical() : super.symmetric(vertical: normalValue);
  const PaddingConstants.screenPaddingHorizontal() : super.symmetric(horizontal: mediumValue);

  // Padding Values
  static const double tinyValue = SizeConstants.tiny;
  static const double lowValue = SizeConstants.low;
  static const double normalValue = SizeConstants.normal;
  static const double mediumValue = SizeConstants.medium;
  static const double highValue = SizeConstants.high;

  /// Some devices have a bottom padding due to the navigation bar or similar.
  /// This method checks if there is a bottom padding and returns it.
  /// If there is no padding, it returns the default padding.
  ///
  @protected
  static double getAdaptiveViewPaddingBottom(BuildContext context) {
    final double viewPaddingBottom = MediaQuery.viewPaddingOf(context).bottom;
    final double viewInsetsBottom = MediaQuery.viewInsetsOf(context).bottom;
    if (viewInsetsBottom > 0) {
      return const PaddingConstants.screenPaddingBottom().bottom;
    } else if (viewPaddingBottom > 0) {
      return viewPaddingBottom + (const PaddingConstants.screenPaddingBottom().bottom * .5);
    } else {
      return const PaddingConstants.screenPaddingBottom().bottom;
    }
  }
}
