import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/user_schedule_times_model/user_schedule_times_model.dart';

part 'custom_interval_model.mapper.dart';

@MappableClass()
class QuoteNotificationScheduleCustomIntervalModel with QuoteNotificationScheduleCustomIntervalModelMappable {
  const QuoteNotificationScheduleCustomIntervalModel({
    required this.notificationSchedules,
  });
  final List<ScheduleTime> notificationSchedules;

  static const fromMap = QuoteNotificationScheduleCustomIntervalModelMapper.fromMap;
  static const fromJson = QuoteNotificationScheduleCustomIntervalModelMapper.fromJson;
}
