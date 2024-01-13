import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        fontName: defaultFontName,
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
