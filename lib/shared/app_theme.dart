import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotely/shared/theme/color_scheme.dart';

part 'theme/custom_theme_configs/sign_view_theme.dart';
part 'theme/themes/dark_theme.dart';
part 'theme/themes/light_theme.dart';

@immutable
final class AppThemeManager with _AppDarkTheme, _AppLightTheme {
  factory AppThemeManager() => instance;

  const AppThemeManager._internal();
  static const AppThemeManager instance = AppThemeManager._internal();

  ColorScheme get colorScheme => themeData.colorScheme;

  TextTheme get textTheme => themeData.textTheme;

  ThemeData get themeData => isDarkMode ? darkThemeData : lightThemeData;

  bool get isDarkMode => true;

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;
}
