import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/user_schedule_times_model/user_schedule_times_model.dart';

part 'equal_schedule_model.mapper.dart';

@MappableClass()
class QuoteNotificationEqualScheduleModel with QuoteNotificationEqualScheduleModelMappable {
  const QuoteNotificationEqualScheduleModel({
    required this.notificationSchedules,
    this.notificationStartTime,
    this.notificationEndTime,
    this.notificationInterval,
  });

  final ScheduleTime? notificationStartTime;
  final ScheduleTime? notificationEndTime;
  final int? notificationInterval;
  final List<ScheduleTime> notificationSchedules;

  static const fromMap = QuoteNotificationEqualScheduleModelMapper.fromMap;
  static const fromJson = QuoteNotificationEqualScheduleModelMapper.fromJson;
}
