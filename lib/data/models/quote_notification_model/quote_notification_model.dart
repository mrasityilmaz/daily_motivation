// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotely/core/constants/categories_enum.dart';

part 'quote_notification_model.freezed.dart';
part 'quote_notification_model.g.dart';

@Freezed()
class QuoteNotificationModel extends Equatable with _$QuoteNotificationModel {
  const factory QuoteNotificationModel({
    required String notificationId,
    required List<Categories> notificationCategories,
    required List<int> notificationDaysInWeek,
    required QuoteNotificationEqualScheduleModel? notificationEqualSchedule,
    required QuoteNotificationScheduleCustomIntervalModel? notificationCustomIntervalSchedule,
  }) = _QuoteNotificationModel;

  const QuoteNotificationModel._();

  factory QuoteNotificationModel.fromJson(Map<String, dynamic> json) => _$QuoteNotificationModelFromJson(json);

  @override
  List<Object?> get props => [
        notificationId,
      ];
}

@Freezed()
class QuoteNotificationEqualScheduleModel extends Equatable with _$QuoteNotificationEqualScheduleModel {
  const factory QuoteNotificationEqualScheduleModel({
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) required TimeOfDay? notificationStartTime,
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) required TimeOfDay? notificationEndTime,
    required int? notificationInterval,
    @JsonKey(
      fromJson: _listTimeOfDayFromJson,
      toJson: _listTimeOfDayToJson,
    )
    required List<TimeOfDay> notificationSchedules,
  }) = _QuoteNotificationEqualScheduleModel;

  factory QuoteNotificationEqualScheduleModel.fromJson(Map<String, dynamic> json) => _$QuoteNotificationEqualScheduleModelFromJson(json);

  const QuoteNotificationEqualScheduleModel._();

  @override
  List<Object?> get props => [
        this,
      ];
}

@Freezed()
class QuoteNotificationScheduleCustomIntervalModel extends Equatable with _$QuoteNotificationScheduleCustomIntervalModel {
  const factory QuoteNotificationScheduleCustomIntervalModel({
    @JsonKey(
      fromJson: _listTimeOfDayFromJson,
      toJson: _listTimeOfDayToJson,
    )
    required List<TimeOfDay> notificationSchedules,
  }) = _QuoteNotificationScheduleCustomIntervalModel;

  factory QuoteNotificationScheduleCustomIntervalModel.fromJson(Map<String, dynamic> json) => _$QuoteNotificationScheduleCustomIntervalModelFromJson(json);

  const QuoteNotificationScheduleCustomIntervalModel._();

  @override
  List<Object?> get props => [
        this,
      ];
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
