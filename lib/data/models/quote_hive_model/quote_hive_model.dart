import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_hive_model.freezed.dart';
part 'quote_hive_model.g.dart';

///
/// If you want to [immutable] class, you should use [@Freezed()]
///
/// If you want to [mutable] class, you should use [@unfreezed]
///
///
/// You can create another one class same like this class
///

@Freezed()
class QuoteHiveModel with _$QuoteHiveModel, EquatableMixin {
  const factory QuoteHiveModel({
    required String category,
    required String quote,
    required String author,
    required String id,
    required DateTime createdAt,
  }) = _QuoteHiveModel;

  factory QuoteHiveModel.empty() {
    return QuoteHiveModel(
      category: '',
      quote: '',
      author: 'Raşit Yılmaz',
      id: UniqueKey().toString(),
      createdAt: DateTime.now().toUtc(),
    );
  }

  const QuoteHiveModel._();

  factory QuoteHiveModel.fromJson(Map<String, dynamic> json) => _$QuoteHiveModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        author,
      ];
}


  // {
  //           "category": "Sanat",
  //           "quote": "Sanat gerçekleri tanımamıza yardımcı olan bir yalandır.",
  //           "author": "Pablo Picasso",
  //           "id": "ztxeghofz"
  //       },