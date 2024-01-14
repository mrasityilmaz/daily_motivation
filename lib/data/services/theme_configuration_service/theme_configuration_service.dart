import 'package:daily_motivation/core/constants/default_fonts_enum.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

part 'theme_configuration_service_mixin.dart';

@immutable
@LazySingleton()
final class ThemeConfigurationService with ListenableServiceMixin, _ThemeConfigurationserviceMixin {
  ThemeConfigurationService() {
    _themeConfiguration = ReactiveValue<ThemeConfigurationModel>(
      ThemeConfigurationModel(
        backgroundPath: defaultBackgroundPath,
        fontName: defaultFont.fontFamily,
        maxFontSize: defaultFont.maxFontSize,
        minFontSize: defaultFont.minFontSize,
        textColor: Colors.white,
      ),
    );

    listenToReactiveValues([_themeConfiguration]);
  }

  Future<void> init() async {}

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

      // TODOsave configuraiton
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
