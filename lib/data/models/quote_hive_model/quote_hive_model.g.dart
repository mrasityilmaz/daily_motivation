// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_hive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteHiveModelImpl _$$QuoteHiveModelImplFromJson(Map<String, dynamic> json) =>
    _$QuoteHiveModelImpl(
      category: json['category'] as String,
      quote: json['quote'] as String,
      author: json['author'] as String,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$QuoteHiveModelImplToJson(
        _$QuoteHiveModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'quote': instance.quote,
      'author': instance.author,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };
