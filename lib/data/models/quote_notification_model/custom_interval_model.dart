import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'custom_interval_model.mapper.dart';

@MappableClass()
class QuoteNotificationScheduleCustomIntervalModel with QuoteNotificationScheduleCustomIntervalModelMappable {
  const QuoteNotificationScheduleCustomIntervalModel({
    required this.notificationSchedules,
  });
  final List<TimeOfDay> notificationSchedules;

  static const fromMap = QuoteNotificationScheduleCustomIntervalModelMapper.fromMap;
  static const fromJson = QuoteNotificationScheduleCustomIntervalModelMapper.fromJson;
}
