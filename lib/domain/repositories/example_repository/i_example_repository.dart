import 'package:daily_motivation/core/extensions/dartz_extension.dart';
import 'package:daily_motivation/data/models/example_model.dart';

abstract class IExampleRepository {
  Future<DataModel<ExampleModel>> getSomeData();
  Future<DataModel<List<ExampleModel>>> getSomeListData();
}
