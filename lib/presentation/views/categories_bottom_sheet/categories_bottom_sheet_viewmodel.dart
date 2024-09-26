import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/services/quote_and_category_service/quote_and_category_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

class CategoriesBottomSheetViewModel extends ReactiveViewModel {
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

  bool isCategorySelected(Categories category) {
    return selectedCategory == category;
  }

  Future<void> changeCategory(BuildContext context, {required Categories category, String locale = 'tr'}) async {
    await _categoryService.changeCategory(category: category, locale: locale);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_categoryService, _premiumServices];
}
