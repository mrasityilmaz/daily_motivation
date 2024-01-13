import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class ThemeConfigurationModel extends Equatable {
  const ThemeConfigurationModel({required this.backgroundPath, required this.fontName, required this.textColor});

  final String backgroundPath;
  final String fontName;

  final Color textColor;

  @override
  List<Object?> get props => [
        backgroundPath,
        fontName,
        textColor,
      ];
}
