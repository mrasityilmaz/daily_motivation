import 'dart:convert';

import 'package:daily_motivation/data/models/quote_notification_model/quote_notification_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class QuoteNotificationHiveAdapter extends TypeAdapter<QuoteNotificationModel> {
  @override
  QuoteNotificationModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return QuoteNotificationModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, QuoteNotificationModel obj) {
    writer.write(obj.toJson());
  }
}

final class QuoteNotificationEqualScheduleModelHiveAdapter extends TypeAdapter<QuoteNotificationEqualScheduleModel> {
  @override
  QuoteNotificationEqualScheduleModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return QuoteNotificationEqualScheduleModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 6;

  @override
  void write(BinaryWriter writer, QuoteNotificationEqualScheduleModel obj) {
    writer.write(obj.toJson());
  }
}

final class QuoteNotificationScheduleCustomIntervalModelHiveAdapter extends TypeAdapter<QuoteNotificationScheduleCustomIntervalModel> {
  @override
  QuoteNotificationScheduleCustomIntervalModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return QuoteNotificationScheduleCustomIntervalModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 7;

  @override
  void write(BinaryWriter writer, QuoteNotificationScheduleCustomIntervalModel obj) {
    writer.write(obj.toJson());
  }
}
