import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

///
/// If you want to [immutable] class, you should use [@Freezed()]
///
/// If you want to [mutable] class, you should use [@unfreezed]
///
///
/// You can create another one class same like this class
///

@Freezed()
class QuoteModel with _$QuoteModel, EquatableMixin {
  const factory QuoteModel({
    required String category,
    required String quote,
    required String author,
    required String id,
  }) = _QuoteModel;

  const QuoteModel._();

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
      ];
}


  // {
  //           "category": "Sanat",
  //           "quote": "Sanat gerçekleri tanımamıza yardımcı olan bir yalandır.",
  //           "author": "Pablo Picasso",
  //           "id": "ztxeghofz"
  //       },