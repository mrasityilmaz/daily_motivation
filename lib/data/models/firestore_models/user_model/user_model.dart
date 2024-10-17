import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/user_schedule_times_model/user_schedule_times_model.dart';

part 'user_model.mapper.dart';

@immutable
@MappableClass()
final class UserModel with UserModelMappable {
  const UserModel({
    required this.uid,
    this.timeZone,
    this.sendNotifications,
    this.deviceToken,
    this.scheduleTimes,
    this.lastScheduledDate,
  });

  /// {@template UserModel.uid}
  /// Unique identifier for the user
  /// This is the same as the Firebase Auth UID
  /// {@endtemplate}
  final String uid;

  /// {@template UserModel.deviceToken}
  /// The device token for the user's device
  /// This is used to send push notifications to the user
  /// This is generated by Firebase Messaging
  /// {@endtemplate}
  final String? deviceToken;

  /// {@template UserModel.sendNotifications}
  /// Whether the user has enabled notifications
  /// This is used to determine whether to send notifications to the user
  /// This is set by notfication permission and can be changed by the user
  ///
  /// Default is `null` which means the user has not excepted or denied the permission yet
  /// If the user has denied the permission, this will be `false`
  /// If the user has accepted the permission, this will be `true`
  ///
  /// And the otherhand,
  /// if the user had accepted the permission and then when the user disabled the notification status on SettingsView, this will be `false`
  /// if the user had denied the permission or when the user enabled the notification status on SettingsView, this will be `false`
  ///
  ///
  /// Mean's that, this value is not only for the permission status, it's also for the user's choice
  /// ```dart
  /// isGranted + userChoice = true
  /// isGranted + !userChoice = false
  /// !isGranted + userChoice = request permission
  /// !isGranted + !userChoice = request permission
  /// ```
  /// {@endtemplate}
  final bool? sendNotifications;

  /// The schedule times for the user
  /// {@macro UserNotificationScheduleTimes}
  final UserNotificationScheduleTimes? scheduleTimes;

  /// The user's timezone
  /// This will be used to determine the user's local time for the notifications
  final String? timeZone;

  /// {@template UserModel.lastScheduledDate}
  /// The last scheduled date for the user
  ///
  /// Firebase pushes the silent notifications to the user's device
  /// and the app will calculate the [scheduleTimes] and the setup the notifications on background
  ///
  /// Means that, this parameter is used to decide it's time to setup the notifications or not
  /// Approximatlly, every day at 00:00 AM and 12:00 PM, the app will check this parameter
  ///
  /// It's only setted when notifications are setup
  /// {@endtemplate}
  final DateTime? lastScheduledDate;

  static const fromJson = UserModelMapper.fromJson;
  static const fromJsonString = UserModelMapper.fromJsonString;
}
