import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';

abstract class IUserRemoteRepository {
  Future<DataModel<QuoteModel>> getSomeData();
  Future<DataModel<List<QuoteModel>>> getSomeListData();
}
