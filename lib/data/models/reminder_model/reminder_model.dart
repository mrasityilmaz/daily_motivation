import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/core_mappers/time_of_day_mapper.dart';

part 'reminder_model.mapper.dart';

@immutable
@MappableClass()
final class ReminderModel with ReminderModelMappable {
  const ReminderModel({
    required this.notificationId,
    required this.notificationTitle,
    required this.notificationBody,
    required this.notificationDaysInWeek,
    this.notificationEqualSchedule,
    this.notificationCustomIntervalSchedule,
  });

  final String notificationId;
  final String notificationTitle;
  final String notificationBody;
  final List<int> notificationDaysInWeek;
  final ReminderNotificationEqualScheduleModel? notificationEqualSchedule;
  final ReminderNotificationScheduleCustomIntervalModel? notificationCustomIntervalSchedule;

  static const fromMap = ReminderModelMapper.fromMap;
  static const fromJson = ReminderModelMapper.fromJson;
}

@immutable
@MappableClass(includeCustomMappers: [TimeOfDayMapper()])
final class ReminderNotificationEqualScheduleModel with ReminderNotificationEqualScheduleModelMappable {
  const ReminderNotificationEqualScheduleModel({
    required this.notificationSchedules,
    this.notificationStartTime,
    this.notificationEndTime,
    this.notificationInterval,
  });

  final TimeOfDay? notificationStartTime;
  final TimeOfDay? notificationEndTime;
  final int? notificationInterval;
  final List<TimeOfDay> notificationSchedules;

  static const fromMap = ReminderNotificationEqualScheduleModelMapper.fromMap;
  static const fromJson = ReminderNotificationEqualScheduleModelMapper.fromJson;
}

@immutable
@MappableClass(includeCustomMappers: [TimeOfDayMapper()])
final class ReminderNotificationScheduleCustomIntervalModel
    with ReminderNotificationScheduleCustomIntervalModelMappable {
  const ReminderNotificationScheduleCustomIntervalModel({
    required this.notificationSchedules,
  });

  final List<TimeOfDay> notificationSchedules;

  static const fromMap = ReminderNotificationScheduleCustomIntervalModelMapper.fromMap;
  static const fromJson = ReminderNotificationScheduleCustomIntervalModelMapper.fromJson;
}
