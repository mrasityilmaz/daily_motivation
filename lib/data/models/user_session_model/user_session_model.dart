import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';

part 'user_session_model.mapper.dart';

@immutable
@MappableClass()
final class UserSessionModel with UserSessionModelMappable {
  const UserSessionModel({
    required this.deviceId,
    required this.lastLoginTime,
    this.sessionToken,
  });

  final String deviceId;

  final DateTime lastLoginTime;

  final String? sessionToken;

  static const fromMap = UserSessionModelMapper.fromMap;
  static const fromJson = UserSessionModelMapper.fromJson;
}
