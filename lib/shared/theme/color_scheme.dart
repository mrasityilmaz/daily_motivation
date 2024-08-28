import 'package:flutter/material.dart';

final class AppColorScheme {
  factory AppColorScheme() => instance;

  const AppColorScheme._internal();
  static const AppColorScheme instance = AppColorScheme._internal();

  Color get primaryColor => const Color(0xFF6176f6);

  MaterialColor get primarySwatch {
    return MaterialColor(primaryColor.value, {
      50: const Color(0xFFb0bbfb),
      100: const Color(0xFFa0adfa),
      200: const Color(0xFF909ff9),
      300: const Color(0xFF8191f8),
      400: const Color(0xFF7184f7),
      500: primaryColor,
      600: const Color(0xFF272f62),
      700: const Color(0xFF1d234a),
      800: const Color(0xFF131831),
      900: const Color(0xFF0a0c19),
    });
  }

  Color get surfaceColor => const Color(0xFF667085);

  Color get backgroundColor => Colors.white;

  Color get blackColor => Colors.black;
  Color get secondBlackColor => const Color(0xFF475467);

  Color get primaryOrangeColor => const Color(0XffFFA500);

  Color get lightGreyColor => const Color(0xFFEAECF0);
  Color get darkGreyColor => const Color(0xFF2E3440);
}




/// 141F28
/// 3E4854
/// 627A95
/// C4D0D5
/// F6FFFF
/// 