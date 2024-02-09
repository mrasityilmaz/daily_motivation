import 'package:daily_motivation/core/constants/hive_constants.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/hive_service/i_hivebox_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class ThemeConfigurationBoxService extends IHiveBoxService<ThemeConfigurationModel> {
  ThemeConfigurationBoxService({required super.boxKey});

  @override
  Box<ThemeConfigurationModel> get box => Hive.box<ThemeConfigurationModel>(boxKey);

  ThemeConfigurationModel? get currentThemeConfiguration => box.get(HiveConstants.themeConfigurationBoxKey);

  Future<void> setCurrentThemeConfiguration(ThemeConfigurationModel themeConfiguration) async {
    try {
      await box.put(HiveConstants.themeConfigurationBoxKey, themeConfiguration);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
