import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@Freezed()
class QuoteModel with _$QuoteModel, EquatableMixin {
  const factory QuoteModel({
    required String category,
    required String quote,
    required String author,
    required String id,
  }) = _QuoteModel;

  factory QuoteModel.empty() {
    return QuoteModel(
      category: '',
      quote: '',
      author: 'Raşit Yılmaz',
      id: UniqueKey().toString(),
    );
  }

  const QuoteModel._();

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
      ];

  QuoteHiveModel get toHiveModel => QuoteHiveModel(
        author: author,
        createdAt: DateTime.now().toUtc(),
        id: id,
        category: category,
        quote: quote,
      );
}


  // {
  //           "category": "Sanat",
  //           "quote": "Sanat gerçekleri tanımamıza yardımcı olan bir yalandır.",
  //           "author": "Pablo Picasso",
  //           "id": "ztxeghofz"
  //       },