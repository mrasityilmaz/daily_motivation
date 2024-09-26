import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/extensions/models_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/services/hive_service/boxes/category_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

part 'quote_and_category_service_mixin.dart';

@immutable
@LazySingleton()
final class QuoteAndCategoryService with ListenableServiceMixin, _QuoteAndCategoryServiceMixin {
  QuoteAndCategoryService() {
    _selectedCategory = ReactiveValue<Categories>(_categoryBoxService.selectedCategory);
    listenToReactiveValues([_selectedCategory, _quotes]);
  }

  Future<void> init() async {
    await _fetchQuotesForSelectedCategory();
  }

  final CategoryBoxService _categoryBoxService = locator<HiveService>().categoryBoxService;

  ///
  // TODO - BUraya premium geldiğinde free kullanıcılar için yalnızca bir seçim yapma izni eklenicek
  ///

  ///
  /// Reactive Values
  ///
  final ReactiveValue<List<QuoteModel>> _quotes =
      ReactiveValue<List<QuoteModel>>(List<QuoteModel>.empty(growable: true));
  late final ReactiveValue<Categories> _selectedCategory;

  ///
  /// Reactive Values Getters
  ///
  Categories get selectedCategory => _selectedCategory.value;
  List<QuoteModel> get currentQuotes => _quotes.value;

  ///
  /// it will change local reactive value and then it will fetch new quotes for new category
  /// lastly it writes the new category to box
  ///
  Future<void> changeCategory({required Categories category, String locale = 'tr'}) async {
    try {
      _selectedCategory.value = category;
      await _fetchQuotesForSelectedCategory(locale: locale);
      await _categoryBoxService.changeCategory(category);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Fetches quotes for the selected category.
  ///
  /// [locale] is an optional parameter that specifies the locale for the quotes.
  /// The default value is 'tr' (Turkish).
  ///
  /// This method calls [_changeSelectedCategory] to update the selected category
  /// and then updates the [_quotes] value with the fetched quotes.
  /// Finally, it notifies the listeners about the changes.
  Future<void> _fetchQuotesForSelectedCategory({String locale = 'tr'}) async {
    await _changeSelectedCategory(
      categoryKey: _selectedCategory.value,
      onQuotesChanged: (List<QuoteModel> quotes) {
        _quotes.value = quotes;
      },
      locale: locale,
    );

    notifyListeners();
  }
}
