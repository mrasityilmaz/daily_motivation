import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/models/callable_models/generate_token_model.dart';
import 'package:quotely/data/models/user_session_model/user_session_model.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/domain/repositories/auth_repository/i_auth_repository.dart';
import 'package:quotely/domain/repositories/user_repository/i_user_repository.dart';
import 'package:quotely/injection/injection_container.dart';

part 'sign_in_helper.dart';

@immutable
final class AuthService with _SignInHelper {
  AuthService();

  @override
  Future<bool> signIn({required String deviceId}) async {
    // It's just a placeholder for the real implementation
    return super.signIn(deviceId: deviceId);
  }
}
