import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/hive_service/i_hivebox_service.dart';

@immutable
final class ThemeConfigurationBoxService extends IHiveBoxService<ThemeConfigurationModel> {
  ThemeConfigurationBoxService({required super.boxKey});

  @override
  Box<ThemeConfigurationModel> get box => Hive.box<ThemeConfigurationModel>(boxKey);

  ThemeConfigurationModel? get currentThemeConfiguration => box.get(boxKey);

  Future<void> setCurrentThemeConfiguration(ThemeConfigurationModel themeConfiguration) async {
    try {
      await box.put(boxKey, themeConfiguration);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
