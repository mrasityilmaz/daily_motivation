import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/core_mappers/time_of_day_mapper.dart';

part 'equal_schedule_model.mapper.dart';

@MappableClass(includeCustomMappers: [TimeOfDayMapper()])
final class QuoteNotificationEqualScheduleModel with QuoteNotificationEqualScheduleModelMappable {
  const QuoteNotificationEqualScheduleModel({
    required this.notificationSchedules,
    this.notificationStartTime,
    this.notificationEndTime,
    this.notificationInterval,
  });

  final TimeOfDay? notificationStartTime;
  final TimeOfDay? notificationEndTime;
  final int? notificationInterval;
  final List<TimeOfDay> notificationSchedules;

  static const fromJson = QuoteNotificationEqualScheduleModelMapper.fromJson;
  static const fromJsonString = QuoteNotificationEqualScheduleModelMapper.fromJsonString;
}
