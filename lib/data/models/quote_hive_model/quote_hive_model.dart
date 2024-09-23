import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';

part 'quote_hive_model.mapper.dart';

@MappableClass()
class QuoteHiveModel with QuoteHiveModelMappable {
  const QuoteHiveModel({
    required this.category,
    required this.quote,
    required this.author,
    required this.id,
    required this.createdAt,
  });

  factory QuoteHiveModel.empty() {
    return QuoteHiveModel(
      category: '',
      quote: '',
      author: 'Raşit Yılmaz',
      id: UniqueKey().toString(),
      createdAt: DateTime.now().toUtc(),
    );
  }

  static const fromMap = QuoteHiveModelMapper.fromMap;
  static const fromJson = QuoteHiveModelMapper.fromJson;

  final String category;
  final String quote;
  final String author;
  final String id;
  final DateTime createdAt;
}
