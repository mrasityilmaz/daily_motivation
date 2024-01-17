part of '../hive_service.dart';

mixin _ThemeConfigurationServiceMixin {
  late final Box<ThemeConfigurationModel> _themeConfigurationBox = Hive.box<ThemeConfigurationModel>(HiveConstants.themeConfigurationBoxKey);

  ThemeConfigurationModel? get currentThemeConfiguration => _themeConfigurationBox.get(HiveConstants.themeConfigurationBoxKey);

  Future<void> setCurrentThemeConfiguration(ThemeConfigurationModel themeConfiguration) async {
    try {
      await _themeConfigurationBox.put(HiveConstants.themeConfigurationBoxKey, themeConfiguration);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
