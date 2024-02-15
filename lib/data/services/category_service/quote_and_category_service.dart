import 'dart:convert';

import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/data/models/quote_model/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

part 'quote_and_category_service_mixin.dart';

@immutable
@LazySingleton()
final class QuoteAndCategoryService with ListenableServiceMixin, _QuoteAndCategoryServiceMixin {
  QuoteAndCategoryService() {
    listenToReactiveValues([_selectedCategories, _quotes]);
  }

  Future<void> init() async {
    await _fetchQuotesForSelectedCategory();
  }

  ///
  // TODOBUraya premium geldiğinde free kullanıcılar için yalnızca bir seçim yapma izni eklenicek
  ///

  ///
  /// Reactive Values
  ///
  final ReactiveValue<List<QuoteModel>> _quotes = ReactiveValue<List<QuoteModel>>([]);
  final ReactiveValue<List<Categories>> _selectedCategories = ReactiveValue<List<Categories>>([Categories.general]);

  ///
  /// Reactive Values Getters
  ///
  List<Categories> get selectedCategories => _selectedCategories.value;
  List<QuoteModel> get currentQuotes => _quotes.value;

  Future<void> changeCategory({required List<Categories> categories, String locale = 'tr'}) async {
    try {
      _selectedCategories.value = categories;
      await _fetchQuotesForSelectedCategory(locale: locale);
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
      categoryKeys: _selectedCategories.value,
      onQuotesChanged: (List<QuoteModel> quotes) {
        _quotes.value = quotes;
      },
      locale: locale,
    );

    notifyListeners();
  }
}
