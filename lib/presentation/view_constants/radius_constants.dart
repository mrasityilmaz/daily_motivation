import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/size_constants.dart';

/// This class contains all the [BorderRadius] constants used in the app
///
// Thanks to @vb10 for the idea
///
/// ```dart
/// // tiny < low < normal < medium < high
/// static const Radius tinyRadius = Radius.circular(4);
/// static const Radius lowValue = Radius.circular(8);
/// static const Radius normalRadius = Radius.circular(12);
/// static const Radius mediumRadius = Radius.circular(16);
/// static const Radius highRadius = Radius.circular(20);
/// ```
@immutable
final class RadiusConstants extends BorderRadius {
  // ignore: unused_element
  const RadiusConstants._() : super.all(Radius.zero);

  // Radius All
  const RadiusConstants.all(super.value) : super.all();
  const RadiusConstants.allTiny() : super.all(tinyRadius);
  const RadiusConstants.allLow() : super.all(lowValue);
  const RadiusConstants.allNormal() : super.all(normalRadius);
  const RadiusConstants.allMedium() : super.all(mediumRadius);
  const RadiusConstants.allHigh() : super.all(highRadius);

  // Radius Only Top
  const RadiusConstants.top(Radius value) : super.vertical(top: value);
  const RadiusConstants.tinyTop() : super.vertical(top: tinyRadius);
  const RadiusConstants.lowTop() : super.vertical(top: lowValue);
  const RadiusConstants.normalTop() : super.vertical(top: normalRadius);
  const RadiusConstants.mediumTop() : super.vertical(top: mediumRadius);
  const RadiusConstants.highTop() : super.vertical(top: highRadius);

  // Radius Only Bottom
  const RadiusConstants.bottom(Radius value) : super.vertical(bottom: value);
  const RadiusConstants.tinyBottom() : super.vertical(bottom: tinyRadius);
  const RadiusConstants.lowBottom() : super.vertical(bottom: lowValue);
  const RadiusConstants.normalBottom() : super.vertical(bottom: normalRadius);
  const RadiusConstants.mediumBottom() : super.vertical(bottom: mediumRadius);
  const RadiusConstants.highBottom() : super.vertical(bottom: highRadius);

  // Radius Only Left
  const RadiusConstants.left(Radius value) : super.horizontal(left: value);
  const RadiusConstants.tinyLeft() : super.horizontal(left: tinyRadius);
  const RadiusConstants.lowLeft() : super.horizontal(left: lowValue);
  const RadiusConstants.normalLeft() : super.horizontal(left: normalRadius);
  const RadiusConstants.mediumLeft() : super.horizontal(left: mediumRadius);
  const RadiusConstants.highLeft() : super.horizontal(left: highRadius);

  // Radius Only Right
  const RadiusConstants.right(Radius value) : super.horizontal(right: value);
  const RadiusConstants.tinyRight() : super.horizontal(right: tinyRadius);
  const RadiusConstants.lowRight() : super.horizontal(right: lowValue);
  const RadiusConstants.normalRight() : super.horizontal(right: normalRadius);
  const RadiusConstants.mediumRight() : super.horizontal(right: mediumRadius);
  const RadiusConstants.highRight() : super.horizontal(right: highRadius);

  // Radius Only TopLeft
  const RadiusConstants.tinyTopLeft() : super.only(topLeft: tinyRadius);
  const RadiusConstants.lowTopLeft() : super.only(topLeft: lowValue);
  const RadiusConstants.normalTopLeft() : super.only(topLeft: normalRadius);
  const RadiusConstants.mediumTopLeft() : super.only(topLeft: mediumRadius);
  const RadiusConstants.highTopLeft() : super.only(topLeft: highRadius);

  // Radius Only TopRight
  const RadiusConstants.tinyTopRight() : super.only(topRight: tinyRadius);
  const RadiusConstants.lowTopRight() : super.only(topRight: lowValue);
  const RadiusConstants.normalTopRight() : super.only(topRight: normalRadius);
  const RadiusConstants.mediumTopRight() : super.only(topRight: mediumRadius);
  const RadiusConstants.highTopRight() : super.only(topRight: highRadius);

  // Radius Only BottomLeft
  const RadiusConstants.tinyBottomLeft() : super.only(bottomLeft: tinyRadius);
  const RadiusConstants.lowBottomLeft() : super.only(bottomLeft: lowValue);
  const RadiusConstants.normalBottomLeft() : super.only(bottomLeft: normalRadius);
  const RadiusConstants.mediumBottomLeft() : super.only(bottomLeft: mediumRadius);
  const RadiusConstants.highBottomLeft() : super.only(bottomLeft: highRadius);

  // Radius Only BottomRight
  const RadiusConstants.tinyBottomRight() : super.only(bottomRight: tinyRadius);
  const RadiusConstants.lowBottomRight() : super.only(bottomRight: lowValue);
  const RadiusConstants.normalBottomRight() : super.only(bottomRight: normalRadius);
  const RadiusConstants.mediumBottomRight() : super.only(bottomRight: mediumRadius);
  const RadiusConstants.highBottomRight() : super.only(bottomRight: highRadius);

  /// Value: 4
  static const Radius tinyRadius = Radius.circular(SizeConstants.tiny);

  /// Value: 8
  static const Radius lowValue = Radius.circular(SizeConstants.low);

  /// Value: 12
  static const Radius normalRadius = Radius.circular(SizeConstants.normal);

  /// Value: 16
  static const Radius mediumRadius = Radius.circular(SizeConstants.medium);

  /// Value: 20
  static const Radius highRadius = Radius.circular(SizeConstants.high);
}
