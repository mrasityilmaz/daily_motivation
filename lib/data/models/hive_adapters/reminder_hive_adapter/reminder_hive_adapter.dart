import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';

final class ReminderHiveAdapter extends TypeAdapter<ReminderModel> {
  @override
  ReminderModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return ReminderModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer.write(obj.toJson());
  }
}

final class ReminderNotificationEqualScheduleModelHiveAdapter extends TypeAdapter<ReminderNotificationEqualScheduleModel> {
  @override
  ReminderNotificationEqualScheduleModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return ReminderNotificationEqualScheduleModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, ReminderNotificationEqualScheduleModel obj) {
    writer.write(obj.toJson());
  }
}

final class ReminderNotificationScheduleCustomIntervalModelHiveAdapter extends TypeAdapter<ReminderNotificationScheduleCustomIntervalModel> {
  @override
  ReminderNotificationScheduleCustomIntervalModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return ReminderNotificationScheduleCustomIntervalModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, ReminderNotificationScheduleCustomIntervalModel obj) {
    writer.write(obj.toJson());
  }
}
