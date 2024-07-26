import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/categories_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/services/quote_and_category_service/quote_and_category_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:stacked/stacked.dart';

part 'mixins/ui_logic_mixin.dart';

class CategoriesBottomSheetViewModel extends ReactiveViewModel with _UILogicMixin {
  ///
  /// Define services
  ///
  final QuoteAndCategoryService _categoryService = locator<QuoteAndCategoryService>();
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// Getters
  ///
  QuoteAndCategoryService get listenableCategoryService => listenableServices.first as QuoteAndCategoryService;
  PremiumServices get listenablePremiumServices => listenableServices[1] as PremiumServices;

  bool get isPremium => listenablePremiumServices.isPremium;

  Categories get selectedCategory => listenableCategoryService.selectedCategory;

  ///
  ///
  ///
  bool isCategorySelected(Categories category) {
    return selectedCategory == category;
  }

  Future<void> changeCategory(BuildContext context, {required Categories category, String locale = 'tr'}) async {
    await _onTapToChangeCategory(
      context,
      category: category,
      onChangeFunction: () async {
        await Future.delayed(const Duration(milliseconds: 400), () async {
          await _categoryService.changeCategory(category: category, locale: locale);
        });
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_categoryService, _premiumServices];
}
