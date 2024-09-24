import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/user_model/user_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';

@immutable
@Environment(Environment.test)
@LazySingleton(as: IUserRemoteRepository)
final class UserMockRepository implements IUserRemoteRepository {
  @override
  Future<DataModel<UserModel>> createNewUser({required UserModel userModel}) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  Future<DataModel<UserModel>> deleteUser({required String userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<DataModel<UserModel>> getUser({required String userId}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<DataModel<UserModel>> updateUser({required UserModel userModel}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  // @override
  // Future<DataModel<QuoteModel>> getSomeData() async {
  //   try {
  //     final response = await locator<MockReaderService>().callMock<QuoteModel>(
  //       'test/fixtures/example_json.json',
  //       parseModel: QuoteModel.fromMap,
  //     );

  //     ///
  //     /// You can add some logic here to check if response is valid or not
  //     ///
  //     return Right(response);
  //   } catch (e) {
  //     if (e is Response) {
  //       ///
  //       /// This is the case when you have some error from parsing or something else
  //       ///
  //       return Left(UnExpectedFailure(data: e, errorMessage: e.statusMessage));
  //     } else {
  //       ///
  //       /// I dont know what is the error so I will return server failure
  //       ///

  //       return Left(ServerFailure(errorMessage: e.toString()));
  //     }
  //   }
  // }
}
