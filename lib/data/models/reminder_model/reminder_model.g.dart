// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderModelImpl _$$ReminderModelImplFromJson(Map<String, dynamic> json) =>
    _$ReminderModelImpl(
      notificationId: json['notificationId'] as String,
      notificationTitle: json['notificationTitle'] as String,
      notificationBody: json['notificationBody'] as String,
      notificationDaysInWeek: (json['notificationDaysInWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      notificationEqualSchedule: json['notificationEqualSchedule'] == null
          ? null
          : ReminderNotificationEqualScheduleModel.fromJson(
              json['notificationEqualSchedule'] as Map<String, dynamic>),
      notificationCustomIntervalSchedule:
          json['notificationCustomIntervalSchedule'] == null
              ? null
              : ReminderNotificationScheduleCustomIntervalModel.fromJson(
                  json['notificationCustomIntervalSchedule']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReminderModelImplToJson(_$ReminderModelImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationTitle': instance.notificationTitle,
      'notificationBody': instance.notificationBody,
      'notificationDaysInWeek': instance.notificationDaysInWeek,
      'notificationEqualSchedule': instance.notificationEqualSchedule,
      'notificationCustomIntervalSchedule':
          instance.notificationCustomIntervalSchedule,
    };

_$ReminderNotificationEqualScheduleModelImpl
    _$$ReminderNotificationEqualScheduleModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ReminderNotificationEqualScheduleModelImpl(
          notificationStartTime:
              _timeOfDayFromJson(json['notificationStartTime'] as String?),
          notificationEndTime:
              _timeOfDayFromJson(json['notificationEndTime'] as String?),
          notificationInterval: (json['notificationInterval'] as num?)?.toInt(),
          notificationSchedules:
              _listTimeOfDayFromJson(json['notificationSchedules'] as String?),
        );

Map<String, dynamic> _$$ReminderNotificationEqualScheduleModelImplToJson(
        _$ReminderNotificationEqualScheduleModelImpl instance) =>
    <String, dynamic>{
      'notificationStartTime': _timeOfDayToJson(instance.notificationStartTime),
      'notificationEndTime': _timeOfDayToJson(instance.notificationEndTime),
      'notificationInterval': instance.notificationInterval,
      'notificationSchedules':
          _listTimeOfDayToJson(instance.notificationSchedules),
    };

_$ReminderNotificationScheduleCustomIntervalModelImpl
    _$$ReminderNotificationScheduleCustomIntervalModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ReminderNotificationScheduleCustomIntervalModelImpl(
          notificationSchedules:
              _listTimeOfDayFromJson(json['notificationSchedules'] as String?),
        );

Map<String, dynamic>
    _$$ReminderNotificationScheduleCustomIntervalModelImplToJson(
            _$ReminderNotificationScheduleCustomIntervalModelImpl instance) =>
        <String, dynamic>{
          'notificationSchedules':
              _listTimeOfDayToJson(instance.notificationSchedules),
        };
