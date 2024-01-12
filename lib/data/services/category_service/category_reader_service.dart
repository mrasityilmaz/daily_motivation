// ignore_for_file: avoid_dynamic_calls

part of 'category_service.dart';

mixin CategoryReaderService {
  final String _categoryPath = 'assets/quotes/categories/';

  Future<List<QuoteModel>> _readCategoryFromAssets({required String categoryKey, String locale = 'tr'}) async {
    final List<QuoteModel> quotes = List<QuoteModel>.empty(growable: true);
    try {
      final String jsonString = await rootBundle.loadString('$_categoryPath${categoryKey}_quotes.json');
      if (locale == 'tr') {
        final List<dynamic> quotesTrRaw = jsonDecode(jsonString)['tr_quotes'] as List<dynamic>;

        final List<QuoteModel> quotesTr = quotesTrRaw.map((e) => QuoteModel.fromJson(e as Map<String, dynamic>)).toList();

        quotes
          ..clear()
          ..addAll(quotesTr);
      } else {
        final List<dynamic> quotesEnRaw = jsonDecode(jsonString)['en_quotes'] as List<dynamic>;

        final List<QuoteModel> quotesEn = quotesEnRaw.map((e) => QuoteModel.fromJson(e as Map<String, dynamic>)).toList();

        quotes
          ..clear()
          ..addAll(quotesEn);
      }

      return quotes;
    } catch (e) {
      return quotes;
    }
  }
}
