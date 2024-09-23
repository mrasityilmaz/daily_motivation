import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'equal_schedule_model.mapper.dart';

@MappableClass()
class QuoteNotificationEqualScheduleModel with QuoteNotificationEqualScheduleModelMappable {
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

  static const fromMap = QuoteNotificationEqualScheduleModelMapper.fromMap;
  static const fromJson = QuoteNotificationEqualScheduleModelMapper.fromJson;
}
