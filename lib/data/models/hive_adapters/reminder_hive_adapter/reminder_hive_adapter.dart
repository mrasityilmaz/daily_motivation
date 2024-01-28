import 'dart:convert';

import 'package:daily_motivation/data/models/reminder_model/reminder_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
