import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';

abstract class IAuthService {
  Future<EitherOr<UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<EitherOr<UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<EitherOr<UserCredential>> signInWithGoogle();

  Future<EitherOr<UserCredential>> signInWithApple();

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]);

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input);
}
