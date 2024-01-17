import 'dart:convert';

import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class ThemeConfigHiveAdapter extends TypeAdapter<ThemeConfigurationModel> {
  @override
  ThemeConfigurationModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return ThemeConfigurationModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, ThemeConfigurationModel obj) {
    writer.write(obj.toJson());
  }
}
