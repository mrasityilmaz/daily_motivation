import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/firebase/callables/firebase_callables.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';
import 'package:quotely/domain/repositories/auth_repository/data_sources/iremote_repository.dart';

@immutable
@Injectable(as: AuthRemoteRepository, env: [Environment.prod])
final class AuthHttpRepositoryImpl implements AuthRemoteRepository {
  const AuthHttpRepositoryImpl();

  @override
  Future<DataModel<String>> generateToken({required GenerateTokenModel generateTokenModel}) async {
    try {
      final HttpsCallableResult<String> generatedToken =
          await FirebaseCallables.generateCustomToken.call<String>(parameters: generateTokenModel);

      if (generatedToken.data.isNotEmpty) {
        return Right(generatedToken.data);
      }

      return Left(FirestoreException(errorMessage: 'Token could not be created'));
    } catch (error) {
      return Left(FirestoreException(errorMessage: error.toString()));
    }
  }
}
