import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';

final class QuoteHiveAdapter extends TypeAdapter<QuoteHiveModel> {
  @override
  QuoteHiveModel read(BinaryReader reader) {
    final asd = reader.read();
    final jsonConverted = jsonEncode(asd);
    return QuoteHiveModel.fromJson(json.decode(jsonConverted) as Map<String, dynamic>);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, QuoteHiveModel obj) {
    writer.write(obj.toJson());
  }
}
