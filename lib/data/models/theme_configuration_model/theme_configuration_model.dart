// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'theme_configuration_model.mapper.dart';

@MappableClass()
class ThemeConfigurationModel with ThemeConfigurationModelMappable {
  const ThemeConfigurationModel({
    required this.backgroundPath,
    required this.fontName,
    required this.maxFontSize,
    required this.minFontSize,
    required this.textColor,
  });
  final String backgroundPath;
  final String fontName;
  final double maxFontSize;
  final double minFontSize;
  final Color textColor;

  static const fromMap = ThemeConfigurationModelMapper.fromMap;
  static const fromJson = ThemeConfigurationModelMapper.fromJson;
}

int _colorToInt(Color color) {
  return color.value;
}

Color _intToColor(dynamic color) {
  return Color(int.tryParse((color ?? Colors.white.value).toString()) ?? Colors.white.value);
}
