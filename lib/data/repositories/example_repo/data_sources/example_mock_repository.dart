import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/core/services/mock_reader_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/domain/repositories/example_repository/data_sources/iremote_repository.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:rest_api_package/requests/rest_api_request.dart';

@Environment('mock')
@LazySingleton(as: IExampleRemoteRepository)
class ExampleMockRepository implements IExampleRemoteRepository {
  @override
  Future<DataModel<QuoteModel>> getSomeData() async {
    try {
      final response = await locator<MockReaderService>().callMock<QuoteModel>(
        'test/fixtures/example_json.json',
        parseModel: QuoteModel.fromJson,
      );

      ///
      /// You can add some logic here to check if response is valid or not
      ///
      return Right(response);
    } catch (e) {
      if (e is Response) {
        ///
        /// This is the case when you have some error from parsing or something else
        ///
        return Left(UnExpectedFailure(data: e, errorMessage: e.statusMessage));
      } else {
        ///
        /// I dont know what is the error so I will return server failure
        ///

        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<DataModel<List<QuoteModel>>> getSomeListData() async {
    try {
      final response = await locator<MockReaderService>().callMockList<QuoteModel>(
        'test/fixtures/example_list_json.json',
        parseModel: QuoteModel.fromJson,
      );

      ///
      /// You can add some logic here to check if response is valid or not
      ///
      return Right(response);
    } catch (e) {
      if (e is Response) {
        ///
        /// This is the case when you have some error from parsing or something else
        ///
        return Left(UnExpectedFailure(data: e, errorMessage: e.statusMessage));
      } else {
        ///
        /// I dont know what is the error so I will return server failure
        ///

        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
