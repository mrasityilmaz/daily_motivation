import 'dart:convert';

import 'package:daily_motivation/data/models/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

part 'category_reader_service.dart';

@immutable
@LazySingleton()
final class CategoryService with ListenableServiceMixin, CategoryReaderService {
  CategoryService() {
    listenToReactiveValues([]);
  }

//   final ReactiveValue<>

  Future<List<QuoteModel>> readCategoryFromAssets({required String categoryKey, String locale = 'tr'}) async {
    return _readCategoryFromAssets(categoryKey: categoryKey, locale: locale);
  }
}
