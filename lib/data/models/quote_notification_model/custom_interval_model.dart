import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/core_mappers/time_of_day_mapper.dart';

part 'custom_interval_model.mapper.dart';

@MappableClass(includeCustomMappers: [TimeOfDayMapper()])
class QuoteNotificationScheduleCustomIntervalModel with QuoteNotificationScheduleCustomIntervalModelMappable {
  const QuoteNotificationScheduleCustomIntervalModel({
    required this.notificationSchedules,
  });
  final List<TimeOfDay> notificationSchedules;

  static const fromJson = QuoteNotificationScheduleCustomIntervalModelMapper.fromJson;
  static const fromJsonString = QuoteNotificationScheduleCustomIntervalModelMapper.fromJsonString;
}
