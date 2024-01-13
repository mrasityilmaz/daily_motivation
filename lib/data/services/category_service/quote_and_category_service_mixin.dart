// ignore_for_file: avoid_dynamic_calls

part of 'quote_and_category_service.dart';

mixin _QuoteAndCategoryServiceMixin {
  final String _categoryPath = 'assets/quotes/categories/';

  ///
  /// Change the selected category and notify the listeners.
  ///
  ///
  Future<void> _changeSelectedCategory({
    required Categories? categoryKey,
    required ValueChanged<List<QuoteModel>> onQuotesChanged,
    String locale = 'tr',
  }) async {
    try {
      final List<QuoteModel> quotes = List<QuoteModel>.empty(growable: true);
      if (categoryKey == null || categoryKey == Categories.general) {
        await _readGeneralQuotes(locale: locale).then((value) {
          quotes
            ..clear()
            ..addAll(value);
        });
      } else {
        await _readQuotesWithCategory(category: categoryKey, locale: locale).then((value) {
          quotes
            ..clear()
            ..addAll(value);
        });
      }

      if (quotes.isNotEmpty) {
        onQuotesChanged.call(quotes);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<QuoteModel>> _readGeneralQuotes({String locale = 'tr'}) async {
    try {
      return _readAllQuotesForMixedCategories(categories: Categories.values.where((element) => element.isPremium == false).toList(), locale: locale);
    } catch (e) {
      return [];
    }
  }

  /// Reads all quotes for mixed categories.
  ///
  /// Retrieves a list of [QuoteModel] objects by reading quotes for multiple categories.
  /// The [categories] parameter specifies the list of categories to retrieve quotes for.
  /// The [locale] parameter specifies the locale for the quotes (default is 'tr').
  ///
  /// Returns a [Future] that completes with a list of [QuoteModel] objects.
  /// If an error occurs during the process, an empty list is returned.
  Future<List<QuoteModel>> _readAllQuotesForMixedCategories({
    required List<Categories> categories,
    String locale = 'tr',
  }) async {
    try {
      final List<QuoteModel> quotes = List<QuoteModel>.empty(growable: true);

      for (final Categories category in categories.where((element) => !unReadableCategories.contains(element))) {
        final List<QuoteModel> quotesForCategory = await _readQuotesWithCategory(category: category, locale: locale);

        quotes.addAll(quotesForCategory);
      }

      return quotes..shuffle();
    } catch (e) {
      return [];
    }
  }

  /// Reads quotes with the specified category and locale.
  ///
  /// Returns a list of [QuoteModel] objects.
  /// The [category] parameter specifies the category of the quotes.
  /// The [locale] parameter specifies the locale of the quotes (default is 'tr').
  /// If the locale is 'tr', it returns quotes in Turkish (tr_quotes).
  /// If the locale is not 'tr', it returns quotes in English (en_quotes).
  /// If an error occurs during the process, an empty list is returned.

  Future<List<QuoteModel>> _readQuotesWithCategory({
    required Categories category,
    String locale = 'tr',
  }) async {
    try {
      final String jsonString = await rootBundle.loadString('$_categoryPath${category.key}_quotes.json');

      if (locale == 'tr') {
        final List<dynamic> quotesTrRaw = jsonDecode(jsonString)['tr_quotes'] as List<dynamic>;

        final List<QuoteModel> quotesTr = quotesTrRaw.map((e) => QuoteModel.fromJson(e as Map<String, dynamic>)).toList()..shuffle();

        return quotesTr;
      } else {
        final List<dynamic> quotesEnRaw = jsonDecode(jsonString)['en_quotes'] as List<dynamic>;

        final List<QuoteModel> quotesEn = quotesEnRaw.map((e) => QuoteModel.fromJson(e as Map<String, dynamic>)).toList()..shuffle();

        return quotesEn;
      }
    } catch (e) {
      return [];
    }
  }

  List<Categories> get unReadableCategories => [Categories.general, Categories.favorites, Categories.myquotes];
}
