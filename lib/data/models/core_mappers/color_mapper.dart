import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

final class ColorMapper extends SimpleMapper<Color> {
  const ColorMapper();

  @override
  Color decode(Object value) {
    if (value is int) {
      return Color(value);
    } else if (value is String) {
      return Color(int.tryParse(value) ?? Colors.white.value);
    }
    return Colors.white;
  }

  @override
  int? encode(Color self) {
    return self.value;
  }
}
