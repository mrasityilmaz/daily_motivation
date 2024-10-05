import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';
import 'package:quotely/domain/repositories/auth_repository/data_sources/iremote_repository.dart';

@immutable
@Injectable(as: AuthRemoteRepository, env: [Environment.test])
final class AuthMockRepositoryImpl implements AuthRemoteRepository {
  const AuthMockRepositoryImpl();

  @override
  Future<DataModel<String>> generateToken({required GenerateTokenModel generateTokenModel}) {
    // TODO: implement generateToken
    throw UnimplementedError();
  }
}
