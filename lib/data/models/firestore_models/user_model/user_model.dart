import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/firestore/firestore_converter.dart';
import 'package:quotely/data/models/user_schedule_times_model/user_schedule_times_model.dart';

part 'user_model.mapper.dart';

@immutable
@MappableClass()
final class UserModel with UserModelMappable, FirestoreConverter<UserModel> {
  const UserModel({
    required this.timeZone,
    required this.deviceId,
    this.sendNotifications = false,
    this.deviceToken,
    this.scheduleTimes,
    this.lastScheduledDate,
    this.deviceInfo,
  });

  final String deviceId;
  final String? deviceToken;
  final Map<String, dynamic>? deviceInfo;
  final bool sendNotifications;
  final UserNotificationScheduleTimes? scheduleTimes;
  final String timeZone;
  final Timestamp? lastScheduledDate;

  static const fromMap = UserModelMapper.fromMap;
  static const fromJson = UserModelMapper.fromJson;

  @override
  Map<String, dynamic> convertToMap() {
    return toMap();
  }

  @override
  UserModel convertFromMap(Map<String, dynamic> json) {
    return fromMap(json);
  }
}
