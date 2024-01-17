import 'package:flutter/material.dart';

@immutable
final class HiveConstants {
  const HiveConstants._();

  static const String _themeConfigurationBoxKey = '**currentThemeConfiguration**v.1.0.0**';

  static String get themeConfigurationBoxKey => _themeConfigurationBoxKey;
  static const String _likedQuotesBoxKey = '**likedQuotes**v.1.0.0**';

  static String get likedQuotesBoxKey => _likedQuotesBoxKey;
}
