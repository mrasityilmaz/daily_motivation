import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';
import 'package:quotely/domain/repositories/auth_repository/data_sources/ilocal_repository.dart';
import 'package:quotely/domain/repositories/auth_repository/data_sources/iremote_repository.dart';
import 'package:quotely/domain/repositories/auth_repository/i_auth_repository.dart';

@immutable
@Injectable(as: AuthRepository, env: [Environment.prod, Environment.test])
final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final AuthRemoteRepository remoteDataSource;
  final AuthLocalRepository localDataSource;

  @override
  Future<DataModel<String>> generateToken({required GenerateTokenModel generateTokenModel}) async {
    final DataModel<String> result = await remoteDataSource.generateToken(generateTokenModel: generateTokenModel);

    if (result.isRight()) {
      localDataSource.saveToken(token: result.asRight(), deviceId: generateTokenModel.deviceId);
    }

    return result;
  }
}
