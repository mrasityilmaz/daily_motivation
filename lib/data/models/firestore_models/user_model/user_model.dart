import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/user_schedule_times_model/user_schedule_times_model.dart';

part 'user_model.mapper.dart';

@immutable
@MappableClass()
final class UserModel with UserModelMappable {
  const UserModel({
    required this.deviceId,
    this.timeZone,
    this.sendNotifications = false,
    this.deviceToken,
    this.scheduleTimes,
    this.lastScheduledDate,
  });

  final String deviceId;
  final String? deviceToken;
  final bool sendNotifications;
  final UserNotificationScheduleTimes? scheduleTimes;
  final String? timeZone;
  final DateTime? lastScheduledDate;

  static const userFromMap = UserModelMapper.fromMap;
  static const userFromJson = UserModelMapper.fromJson;
}
