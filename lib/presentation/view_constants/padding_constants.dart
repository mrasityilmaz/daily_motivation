import 'package:flutter/material.dart';

/// This class contains all the padding constants used in the app
///
// Thanks to @vb10 for the idea
///
/// ```dart
/// // tiny < low < normal < medium < high
/// // Value: 4
/// static const double tinyValue = 4;
/// // Value: 8
/// static const double lowValue = 8;
/// // Value: 12
/// static const double normalValue = lowValue * 1.5;
/// // Value: 16
/// static const double mediumValue = lowValue * 2;
/// // Value: 20
/// static const double highValue = lowValue * 2.5;
/// ```
@immutable
final class PaddingConstants extends EdgeInsets {
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

  /// Requires a [double] value to be passed
  /// ```dart
  /// MediaQuery.viewPaddingOf(context).bottom
  /// ```
  PaddingConstants.adaptiveScreenPaddingBottom(double viewPaddingBottom)
      : super.only(
          bottom: () {
            if (viewPaddingBottom > 0) {
              return (normalValue * .5) + lowValue;
            } else {
              return normalValue + lowValue;
            }
          }(),
        );

  /// Requires a [double] value to be passed
  /// ```dart
  /// MediaQuery.viewPaddingOf(context).bottom
  /// ```
  PaddingConstants.adaptiveScreenPaddingVertical(double viewPaddingBottom)
      : super.only(
          top: () {
            if (viewPaddingBottom > 0) {
              return (normalValue * .5) + lowValue;
            } else {
              return normalValue + lowValue;
            }
          }(),
          bottom: () {
            if (viewPaddingBottom > 0) {
              return (normalValue * .5) + lowValue;
            } else {
              return normalValue + lowValue;
            }
          }(),
        );

  const PaddingConstants.screenPadding()
      : super.only(
          left: mediumValue,
          right: mediumValue,
          top: normalValue,
          bottom: normalValue,
        );

  const PaddingConstants.screenPaddingLeft() : super.only(left: mediumValue);
  const PaddingConstants.screenPaddingRight() : super.only(right: mediumValue);
  const PaddingConstants.screenPaddingTop() : super.only(top: normalValue);
  const PaddingConstants.screenPaddingBottom() : super.only(bottom: normalValue);
  const PaddingConstants.screenPaddingVertical() : super.symmetric(vertical: normalValue);
  const PaddingConstants.screenPaddingHorizontal() : super.symmetric(horizontal: mediumValue);

  /// Value: 4
  static const double tinyValue = 4;

  /// Value: 8
  static const double lowValue = 8;

  /// Value: 12
  static const double normalValue = lowValue * 1.5;

  /// Value: 16
  static const double mediumValue = lowValue * 2;

  /// Value: 20
  static const double highValue = lowValue * 2.5;
}
