// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'package:equatable/equatable.dart';
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
    required List<DateTime> notificationSchedules,
  }) = _ReminderModel;

  const ReminderModel._();

  factory ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);

  @override
  List<Object?> get props => [
        notificationId,
      ];
}
