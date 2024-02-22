import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/shared/theme/color_scheme.dart';
import 'package:stacked_themes/stacked_themes.dart';

part 'theme/app_theme.dart';
part 'theme/custom/sign_view_theme.dart';

final class AppTheme implements _AppDarkTheme, _AppLightTheme {
  factory AppTheme() => instance;

  AppTheme._internal();
  static final AppTheme instance = AppTheme._internal();

  @override
  ColorScheme get colorScheme => themeData.colorScheme;

  @override
  TextTheme get textTheme => themeData.textTheme;

  @override
  ThemeData get themeData => locator<ThemeService>().isDarkMode ? darkTheme : lightTheme;

  ThemeData get darkTheme => _AppDarkTheme().themeData;
  ThemeData get lightTheme => _AppLightTheme().themeData;
}
