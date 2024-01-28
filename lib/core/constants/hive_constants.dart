import 'package:flutter/material.dart';

@immutable
final class HiveConstants {
  const HiveConstants._();

  static const String _version = 'v.1.0.0';

  static const String _themeConfigurationBoxKey = '**currentThemeConfiguration**$_version**';
  static const String _likedQuotesBoxKey = '**likedQuotes**$_version**';
  static const String _myQuotesBoxKey = '**myQuotes**$_version**';
  static const String _remindersBoxKey = '**reminders**$_version**';

  static String get themeConfigurationBoxKey => _themeConfigurationBoxKey;
  static String get likedQuotesBoxKey => _likedQuotesBoxKey;
  static String get myQuotesBoxKey => _myQuotesBoxKey;
  static String get remindersBoxKey => _remindersBoxKey;
}
