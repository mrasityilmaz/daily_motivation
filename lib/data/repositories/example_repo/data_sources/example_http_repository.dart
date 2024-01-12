import 'package:daily_motivation/core/extensions/dartz_extension.dart';
import 'package:daily_motivation/data/models/quote_model.dart';
import 'package:daily_motivation/domain/repositories/example_repository/data_sources/iremote_repository.dart';
import 'package:injectable/injectable.dart';

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
