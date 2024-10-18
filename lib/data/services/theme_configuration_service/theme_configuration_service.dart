import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/constants/enums/default_fonts_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/hive_service/boxes/theme_config_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:stacked/stacked.dart';

part 'screen_design_tools_mixin.dart';
part 'theme_configuration_service_mixin.dart';

@immutable
@LazySingleton()
final class ThemeConfigurationService
    with ListenableServiceMixin, _ThemeConfigurationserviceMixin, _ScreenDesignToolsMixin {
  ///
  ///
  ///
  ThemeConfigurationService() {
    _initConfig();
    listenToReactiveValues([_themeConfiguration]);
  }
  final ThemeConfigurationBoxService _configurationBoxService = locator<HiveService>().themeConfigurationBoxService;

  Future<void> init(BuildContext context) async {
    try {} catch (e) {
      debugPrint(e.toString());
    }
  }

  ///
  /// Reactive Values
  ///

  late final ReactiveValue<ThemeConfigurationModel> _themeConfiguration;

  ///
  /// Reactive Values Getters
  ///
  ThemeConfigurationModel get currentThemeConfiguration => _themeConfiguration.value;

  Future<void> changeThemeConfiguration({required ThemeConfigurationModel model}) async {
    try {
      _themeConfiguration.value = model;
      await _configurationBoxService.setCurrentThemeConfiguration(model);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///
  /// Init
  ///
  void _initConfig() {
    try {
      final ThemeConfigurationModel? cachedThemeConfig = _configurationBoxService.currentThemeConfiguration;

      if (cachedThemeConfig != null) {
        _themeConfiguration = ReactiveValue<ThemeConfigurationModel>(cachedThemeConfig);
      } else {
        _themeConfiguration = ReactiveValue<ThemeConfigurationModel>(
          ThemeConfigurationModel(
            backgroundPath: defaultBackgroundPath,
            fontName: defaultFont.fontFamily,
            maxFontSize: defaultFont.maxFontSize,
            minFontSize: defaultFont.minFontSize,
            textColor: Colors.white,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
