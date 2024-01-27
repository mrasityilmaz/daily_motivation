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
          .map((e) => e as int)
          .toList(),
      notificationSchedules: (json['notificationSchedules'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$ReminderModelImplToJson(_$ReminderModelImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationTitle': instance.notificationTitle,
      'notificationBody': instance.notificationBody,
      'notificationDaysInWeek': instance.notificationDaysInWeek,
      'notificationSchedules': instance.notificationSchedules
          .map((e) => e.toIso8601String())
          .toList(),
    };
