// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/core_mappers/color_mapper.dart';

part 'theme_configuration_model.mapper.dart';

@MappableClass(includeCustomMappers: [ColorMapper()])
final class ThemeConfigurationModel with ThemeConfigurationModelMappable {
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

  static const fromJson = ThemeConfigurationModelMapper.fromJson;
  static const fromJsonString = ThemeConfigurationModelMapper.fromJsonString;
}
