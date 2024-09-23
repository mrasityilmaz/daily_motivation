import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';

part 'quote_model.mapper.dart';

@MappableClass()
class QuoteModel with QuoteModelMappable {
  const QuoteModel({
    required this.category,
    required this.quote,
    required this.author,
    required this.id,
  });

  factory QuoteModel.empty() {
    return QuoteModel(
      category: '',
      quote: '',
      author: 'Raşit Yılmaz',
      id: UniqueKey().toString(),
    );
  }

  final String category;
  final String quote;
  final String author;
  final String id;

  static const fromMap = QuoteModelMapper.fromMap;
  static const fromJson = QuoteModelMapper.fromJson;

  QuoteHiveModel get toHiveModel => QuoteHiveModel(
        author: author,
        createdAt: DateTime.now().toUtc(),
        id: id,
        category: category,
        quote: quote,
      );
}
