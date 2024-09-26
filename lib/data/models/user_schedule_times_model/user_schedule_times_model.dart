import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/enums/weekday_enum/weekday_enum.dart';

part 'user_schedule_times_model.mapper.dart';

@MappableClass()
typedef ScheduleTime = TimeOfDay;

@immutable
@MappableClass()
final class UserNotificationScheduleTimes with UserNotificationScheduleTimesMappable {
  const UserNotificationScheduleTimes({
    required this.whichDaysOfWeek,
    required this.whichTimesOfDay,
  });

  @MappableEnum(mode: ValuesMode.indexed)
  final List<WeekdayEnum> whichDaysOfWeek;
  final List<ScheduleTime> whichTimesOfDay;

  static const fromMap = UserNotificationScheduleTimesMapper.fromMap;
  static const fromJson = UserNotificationScheduleTimesMapper.fromJson;
}
