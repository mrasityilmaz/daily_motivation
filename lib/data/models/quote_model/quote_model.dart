import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'quote_model.mapper.dart';

@MappableClass()
final class QuoteModel with QuoteModelMappable {
  const QuoteModel({
    required this.category,
    required this.quote,
    required this.author,
    required this.id,
    this.createdAt,
  });

  factory QuoteModel.empty() {
    return QuoteModel(
      category: '',
      quote: '',
      author: 'Raşit Yılmaz',
      id: UniqueKey().toString(),
      createdAt: DateTime.now().toUtc(),
    );
  }

  final String category;
  final String quote;
  final String author;
  final String id;
  final DateTime? createdAt;

  static const fromMap = QuoteModelMapper.fromMap;
  static const fromJson = QuoteModelMapper.fromJson;
}
