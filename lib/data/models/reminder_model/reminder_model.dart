// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

@Freezed()
class ReminderModel extends Equatable with _$ReminderModel {
  const factory ReminderModel({
    required String notificationId,
    required String notificationTitle,
    required String notificationBody,
    required List<int> notificationDaysInWeek,
    required ReminderNotificationEqualScheduleModel? notificationEqualSchedule,
    required ReminderNotificationScheduleCustomIntervalModel? notificationCustomIntervalSchedule,
  }) = _ReminderModel;

  const ReminderModel._();

  factory ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);

  @override
  List<Object?> get props => [
        notificationId,
      ];
}

@Freezed()
class ReminderNotificationEqualScheduleModel extends Equatable with _$ReminderNotificationEqualScheduleModel {
  const factory ReminderNotificationEqualScheduleModel({
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) required TimeOfDay? notificationStartTime,
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) required TimeOfDay? notificationEndTime,
    required int? notificationInterval,
    @JsonKey(
      fromJson: _listTimeOfDayFromJson,
      toJson: _listTimeOfDayToJson,
    )
    required List<TimeOfDay> notificationSchedules,
  }) = _ReminderNotificationEqualScheduleModel;

  factory ReminderNotificationEqualScheduleModel.fromJson(Map<String, dynamic> json) => _$ReminderNotificationEqualScheduleModelFromJson(json);

  const ReminderNotificationEqualScheduleModel._();

  @override
  List<Object?> get props => [
        this,
      ];
}

@Freezed()
class ReminderNotificationScheduleCustomIntervalModel extends Equatable with _$ReminderNotificationScheduleCustomIntervalModel {
  const factory ReminderNotificationScheduleCustomIntervalModel({
    @JsonKey(
      fromJson: _listTimeOfDayFromJson,
      toJson: _listTimeOfDayToJson,
    )
    required List<TimeOfDay> notificationSchedules,
  }) = _ReminderNotificationScheduleCustomIntervalModel;

  factory ReminderNotificationScheduleCustomIntervalModel.fromJson(Map<String, dynamic> json) => _$ReminderNotificationScheduleCustomIntervalModelFromJson(json);

  const ReminderNotificationScheduleCustomIntervalModel._();

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
