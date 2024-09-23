import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/core/platform/network_info.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/domain/repositories/user_repository/data_sources/iremote_repository.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  const UserRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final IUserRemoteRepository remoteDataSource;
  final IUserLocalRepository localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<DataModel<QuoteModel>> getSomeData() async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getSomeData();
    } else {
      ///
      /// I dont have local data source so I will return other options
      ///
      return Left(NetworkFailure());
    }
  }

  @override
  Future<DataModel<List<QuoteModel>>> getSomeListData() async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getSomeListData();
    } else {
      ///
      /// I dont have local data source so I will return other options
      ///
      return Left(NetworkFailure());
    }
  }
}
