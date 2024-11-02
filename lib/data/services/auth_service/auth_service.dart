import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quotely/core/errors/errors.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/core/extensions/error_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/services/auth_service/i_auth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@immutable
final class AuthService implements IAuthService {
  @override
  Future<EitherOr<UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(credential);
    } on FirebaseAuthException catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(AppException(errorMessage: e.localizedErrorMessage));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(UnExpectedException(errorMessage: e.toString()));
    }
  }

  //
  @override
  Future<EitherOr<UserCredential>> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(credential);
    } on FirebaseAuthException catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(AppException(errorMessage: e.localizedErrorMessage));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(UnExpectedException(errorMessage: e.toString()));
    }
  }

  //
  @override
  Future<EitherOr<UserCredential>> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      final userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return Right(userCredential);
    } on SignInWithAppleAuthorizationException catch (e, s) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return Left(UnExpectedException(errorMessage: 'User canceled the sign in flow'));
      }
      LoggerService.catchLog(e, s);
      return Left(UnExpectedException(errorMessage: e.toString()));
    } on FirebaseAuthException catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(AppException(errorMessage: e.localizedErrorMessage));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(UnExpectedException(errorMessage: e.toString()));
    }
  }

  //
  @override
  Future<EitherOr<UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      return Right(userCredential);
    } on FirebaseAuthException catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(AppException(errorMessage: e.localizedErrorMessage));
    } catch (e, s) {
      LoggerService.catchLog(e, s);
      return Left(UnExpectedException(errorMessage: e.toString()));
    }
  }

  @override
  @protected
  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  @override
  @protected
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
