import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';

extension QuoteHiveModelExtension on QuoteHiveModel {
  QuoteModel get toQuoteModel => QuoteModel(category: category, quote: quote, author: author, id: id);
}
