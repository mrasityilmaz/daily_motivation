// ignore_for_file: comment_references

import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/data/models/quote_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/category_service/quote_and_category_service.dart';
import 'package:daily_motivation/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:stacked/stacked.dart';

final class HomeViewModel extends ReactiveViewModel {
  final QuoteAndCategoryService _categoryService = locator<QuoteAndCategoryService>();
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  QuoteAndCategoryService get listenableCategoryService => listenableServices.first as QuoteAndCategoryService;
  ThemeConfigurationService get listenableThemeConfigurationService => listenableServices[1] as ThemeConfigurationService;

  List<QuoteModel> get currentQuoteList => listenableCategoryService.currentQuotes;
  Categories? get selectedCategory => listenableCategoryService.selectedCategory;
  ThemeConfigurationModel get currentThemeConfiguration => listenableThemeConfigurationService.currentThemeConfiguration;

  /// Fetches quotes for the selected category.
  ///
  /// This method calls the [_categoryService.fetchQuotesForSelectedCategory] method to fetch quotes for the selected category.
  /// It takes the [context] parameter as the BuildContext, [categoryKey] parameter as the category key, and [locale] parameter as the language code of the context.
  /// If an error occurs during the fetching process, it catches the error.
  Future<void> init() async {
    try {
      await runBusyFuture(_categoryService.init());
    } catch (e) {}
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_categoryService, _themeConfigurationService];
}
