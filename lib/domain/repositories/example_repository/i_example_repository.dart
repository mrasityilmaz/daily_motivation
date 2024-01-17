import 'package:daily_motivation/core/extensions/dartz_extension.dart';
import 'package:daily_motivation/data/models/quote_model/quote_model.dart';

abstract class IExampleRepository {
  Future<DataModel<QuoteModel>> getSomeData();
  Future<DataModel<List<QuoteModel>>> getSomeListData();
}
