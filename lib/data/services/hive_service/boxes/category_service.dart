import 'dart:async';

import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/services/logger_service.dart';

@immutable
final class CategoryBoxService extends HiveBoxService<String> {
  CategoryBoxService({required super.boxName});

  Categories get selectedCategory => box.get(boxName) != null
      ? Categories.values.firstWhere((element) => element.key == box.get(boxName))
      : Categories.general;

  Future<void> changeCategory(Categories category) async {
    try {
      box.put(boxName, category.key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void clearCategory() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
