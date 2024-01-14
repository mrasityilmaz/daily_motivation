// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_configuration_model.freezed.dart';
part 'theme_configuration_model.g.dart';

@Freezed()
class ThemeConfigurationModel extends Equatable with _$ThemeConfigurationModel {
  const factory ThemeConfigurationModel({
    required String backgroundPath,
    required String fontName,
    required double maxFontSize,
    required double minFontSize,
    @JsonKey(fromJson: _intToColor, toJson: _colorToInt) required final Color textColor,
  }) = _ThemeConfigurationModel;

  const ThemeConfigurationModel._();

  factory ThemeConfigurationModel.fromJson(Map<String, dynamic> json) => _$ThemeConfigurationModelFromJson(json);

  @override
  List<Object?> get props => [
        backgroundPath,
        fontName,
        textColor,
      ];
}

int _colorToInt(Color color) {
  return color.value;
}

Color _intToColor(dynamic color) {
  return Color(int.tryParse((color ?? Colors.white.value).toString()) ?? Colors.white.value);
}
