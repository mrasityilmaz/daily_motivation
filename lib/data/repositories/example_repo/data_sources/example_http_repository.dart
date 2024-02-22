import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/domain/repositories/example_repository/data_sources/iremote_repository.dart';

@Environment('real')
@LazySingleton(as: IExampleRemoteRepository)
class ExampleHttpRepository implements IExampleRemoteRepository {
  @override
  Future<DataModel<QuoteModel>> getSomeData() async {
    // TODO: implement getWeather
    throw UnimplementedError();
  }

  @override
  Future<DataModel<List<QuoteModel>>> getSomeListData() {
    // TODO: implement getSomeListData
    throw UnimplementedError();
  }
}
