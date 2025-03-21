import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';

@immutable
final class ThemeConfigurationBoxService extends HiveBoxService<ThemeConfigurationModel> {
  ThemeConfigurationBoxService()
      : super(boxName: HiveConstants.themeConfigurationBoxKey, fromJson: ThemeConfigurationModel.fromJson);

  ThemeConfigurationModel? get currentThemeConfiguration => box.get(boxName);

  Future<void> setCurrentThemeConfiguration(ThemeConfigurationModel themeConfiguration) async {
    try {
      box.put(boxName, themeConfiguration);
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }
}
