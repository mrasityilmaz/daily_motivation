// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/categories_enum.dart';
import 'package:quotely/data/models/quote_notification_model/custom_interval_model.dart';
import 'package:quotely/data/models/quote_notification_model/equal_schedule_model.dart';

part 'quote_notification_model.mapper.dart';

@MappableClass()
class QuoteNotificationModel with QuoteNotificationModelMappable {
  const QuoteNotificationModel({
    required this.notificationId,
    required this.notificationCategories,
    required this.notificationDaysInWeek,
    this.notificationEqualSchedule,
    this.notificationCustomIntervalSchedule,
  });

  final String notificationId;
  final List<Categories> notificationCategories;
  final List<int> notificationDaysInWeek;
  final QuoteNotificationEqualScheduleModel? notificationEqualSchedule;
  final QuoteNotificationScheduleCustomIntervalModel? notificationCustomIntervalSchedule;

  static const fromMap = QuoteNotificationModelMapper.fromMap;
  static const fromJson = QuoteNotificationModelMapper.fromJson;
}

String? _timeOfDayToJson(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) {
    return null;
  }
  return '${timeOfDay.hour}:${timeOfDay.minute}';
}

TimeOfDay? _timeOfDayFromJson(String? json) {
  if (json == null) {
    return null;
  }
  final List<String> split = json.split(':');
  return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
}

String? _listTimeOfDayToJson(List<TimeOfDay>? timeOfDays) {
  if (timeOfDays == null) {
    return null;
  }
  return json.encode(timeOfDays.map((e) => '${e.hour}:${e.minute}').toList());
}

List<TimeOfDay> _listTimeOfDayFromJson(String? jsonValue) {
  if (jsonValue == null) {
    return [];
  }
  final List<dynamic> split = (json.decode(jsonValue)) as List;
  return split.map((e) {
    final List<String> split = (e as String).split(':');
    return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
  }).toList();
}
