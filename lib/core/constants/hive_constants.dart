import 'package:flutter/material.dart';

@immutable
final class HiveConstants {
  const HiveConstants._();

  ///
  /// $Warning: Do not change the version number, it is used to identify the data in the box.
  /// Only change the version number if you are sure that the data in the box will not be used anymore.
  ///

  static const String _version = 'v.1.0.0';

  static const String _themeConfigurationBoxKey = '**currentThemeConfiguration**$_version**';
  static const String _likedQuotesBoxKey = '**likedQuotes**$_version**';
  static const String _myQuotesBoxKey = '**myQuotes**$_version**';
  static const String _remindersBoxKey = '**reminders**$_version**';
  static const String _quoteNotificationBoxKey = '**quoteNotifications**$_version**';
  static const String _categoryBoxKey = '**category**$_version**';
  static const String _userBoxKey = '**user**$_version**';

  static String get themeConfigurationBoxKey => _themeConfigurationBoxKey;
  static String get likedQuotesBoxKey => _likedQuotesBoxKey;
  static String get myQuotesBoxKey => _myQuotesBoxKey;
  static String get remindersBoxKey => _remindersBoxKey;
  static String get quoteNotificationBoxKey => _quoteNotificationBoxKey;
  static String get categoryBoxKey => _categoryBoxKey;
  static String get userBoxKey => _userBoxKey;
}
