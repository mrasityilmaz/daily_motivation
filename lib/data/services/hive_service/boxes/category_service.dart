import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/core/constants/categories_enum.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/services/hive_service/i_hivebox_service.dart';

final class CategoryBoxService extends IHiveBoxService<String> {
  CategoryBoxService({required super.boxKey});

  @override
  Box<String> get box => Hive.box<String>(boxKey);

  Categories get selectedCategory => box.get(boxKey) != null ? Categories.values.firstWhere((element) => element.key == box.get(boxKey)) : Categories.general;

  Future<void> changeCategory(Categories category) async {
    try {
      await box.put(boxKey, category.key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
