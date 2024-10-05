import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';

abstract class AuthRemoteRepository {
  /// {@template AuthRemoteRepository.generateToken}
  /// Generates a token based on the provided [GenerateTokenModel].
  ///
  /// - Parameter generateTokenModel: The model containing the necessary data to generate the token.
  /// - Returns: A [Future] that resolves to a [DataModel] containing the generated token as a [String].
  /// {@endtemplate}
  Future<DataModel<String>> generateToken({required GenerateTokenModel generateTokenModel});
}
