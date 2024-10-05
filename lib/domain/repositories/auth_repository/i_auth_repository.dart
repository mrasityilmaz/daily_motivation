import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';

abstract class AuthRepository {
  /// {@macro AuthRemoteRepository.generateToken}
  Future<DataModel<String>> generateToken({required GenerateTokenModel generateTokenModel});
}
