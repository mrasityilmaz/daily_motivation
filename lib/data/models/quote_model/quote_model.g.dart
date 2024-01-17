// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteModelImpl _$$QuoteModelImplFromJson(Map<String, dynamic> json) =>
    _$QuoteModelImpl(
      category: json['category'] as String,
      quote: json['quote'] as String,
      author: json['author'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$QuoteModelImplToJson(_$QuoteModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'quote': instance.quote,
      'author': instance.author,
      'id': instance.id,
    };
