import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/default_fonts_enum.dart';
import 'package:quotely/core/constants/premium_constants/theme_constants_mixin.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:stacked/stacked.dart';

part 'mixins/ui_logic_mixin.dart';

final class ThemesBottomSheetViewModel extends ReactiveViewModel with PremiumConstantThemeConfigMixin, _UILogicMixin {
  ///
  /// Define Services
  ///
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// Getters
  ///
  ThemeConfigurationService get _listenableThemeConfigurationService => listenableServices.first as ThemeConfigurationService;
  PremiumServices get _listenablePremiumServices => listenableServices[1] as PremiumServices;

  bool get userIsPremium => _listenablePremiumServices.isPremium;

  bool isThemeConfigPremium(int index) => shouldUserWatchAdToUnlockTheme(index: index, userIsPremium: userIsPremium);

  ThemeConfigurationModel get currentThemeConfiguration => _listenableThemeConfigurationService.currentThemeConfiguration;

  List<String> get allBackgroundList => _themeConfigurationService.allBackgroundList;
  List<DefaultFontsEnum> get allDefaultFontList => _themeConfigurationService.defaultFontList;

  ///
  /// Update Theme Config Function
  ///
  Future<void> updateThemeConfigurationAndPop(BuildContext context, {required bool isLocked, required ThemeConfigurationModel model}) async {
    await _onTapThemeBox(
      context,
      isLocked: isLocked,
      onChanged: () async {
        await Future.delayed(Duration(milliseconds: isLocked ? 500 : 300), () async {
          await _themeConfigurationService.changeThemeConfiguration(model: model);
        });
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _themeConfigurationService,
        _premiumServices,
      ];
}
