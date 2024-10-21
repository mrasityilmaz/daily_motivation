import 'package:flutter/material.dart';

@immutable
final class SizeConstants {
  const SizeConstants._();

  /// Value: 4
  static const double tiny = 4;

  /// Value: 8
  static const double low = 8;

  /// Value: 12
  static const double normal = low * 1.5;

  /// Value: 16
  static const double medium = low * 2;

  /// Value: 20
  static const double high = low * 2.5;
}
