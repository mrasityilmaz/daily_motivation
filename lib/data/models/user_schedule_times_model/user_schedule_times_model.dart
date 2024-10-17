import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/enums/weekday_enum/weekday_enum.dart';

part 'user_schedule_times_model.mapper.dart';

/// {@template UserNotificationScheduleTimes}
/// The schedule times for the user
/// This is used to determine when to send notifications to the user
/// This is set by the user and can be changed by the user
///
/// Default is `null` which means the user has not set the schedule times yet
/// Firebase checks the user [sendNotifications] status if it's true,
/// and also checks the user [scheduleTimes] if it's not null,
/// then it sends the notification to the user.
///
/// If the user has set the schedule times, then the user will receive the notifications only on the specified times
///
/// {@endtemplate}
@immutable
@MappableClass()
final class UserNotificationScheduleTimes with UserNotificationScheduleTimesMappable {
  const UserNotificationScheduleTimes({
    required this.whichDaysOfWeek,
    required this.whichTimesOfDay,
  });

  @MappableEnum(mode: ValuesMode.indexed)
  final List<WeekdayEnum> whichDaysOfWeek;
  final List<TimeOfDay> whichTimesOfDay;

  static const fromJson = UserNotificationScheduleTimesMapper.fromJson;
  static const fromJsonString = UserNotificationScheduleTimesMapper.fromJsonString;
}
