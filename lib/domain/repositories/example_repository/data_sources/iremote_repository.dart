import 'package:daily_motivation/core/extensions/dartz_extension.dart';
import 'package:daily_motivation/data/models/quote_model.dart';

abstract class IExampleRemoteRepository {
  Future<DataModel<QuoteModel>> getSomeData();
  Future<DataModel<List<QuoteModel>>> getSomeListData();
}
