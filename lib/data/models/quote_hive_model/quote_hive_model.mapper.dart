// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quote_hive_model.dart';

class QuoteHiveModelMapper extends ClassMapperBase<QuoteHiveModel> {
  QuoteHiveModelMapper._();

  static QuoteHiveModelMapper? _instance;
  static QuoteHiveModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuoteHiveModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'QuoteHiveModel';

  static String _$category(QuoteHiveModel v) => v.category;
  static const Field<QuoteHiveModel, String> _f$category =
      Field('category', _$category);
  static String _$quote(QuoteHiveModel v) => v.quote;
  static const Field<QuoteHiveModel, String> _f$quote = Field('quote', _$quote);
  static String _$author(QuoteHiveModel v) => v.author;
  static const Field<QuoteHiveModel, String> _f$author =
      Field('author', _$author);
  static String _$id(QuoteHiveModel v) => v.id;
  static const Field<QuoteHiveModel, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(QuoteHiveModel v) => v.createdAt;
  static const Field<QuoteHiveModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);

  @override
  final MappableFields<QuoteHiveModel> fields = const {
    #category: _f$category,
    #quote: _f$quote,
    #author: _f$author,
    #id: _f$id,
    #createdAt: _f$createdAt,
  };

  static QuoteHiveModel _instantiate(DecodingData data) {
    return QuoteHiveModel(
        category: data.dec(_f$category),
        quote: data.dec(_f$quote),
        author: data.dec(_f$author),
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static QuoteHiveModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuoteHiveModel>(map);
  }

  static QuoteHiveModel fromJson(String json) {
    return ensureInitialized().decodeJson<QuoteHiveModel>(json);
  }
}

mixin QuoteHiveModelMappable {
  String toJson() {
    return QuoteHiveModelMapper.ensureInitialized()
        .encodeJson<QuoteHiveModel>(this as QuoteHiveModel);
  }

  Map<String, dynamic> toMap() {
    return QuoteHiveModelMapper.ensureInitialized()
        .encodeMap<QuoteHiveModel>(this as QuoteHiveModel);
  }

  QuoteHiveModelCopyWith<QuoteHiveModel, QuoteHiveModel, QuoteHiveModel>
      get copyWith => _QuoteHiveModelCopyWithImpl(
          this as QuoteHiveModel, $identity, $identity);
  @override
  String toString() {
    return QuoteHiveModelMapper.ensureInitialized()
        .stringifyValue(this as QuoteHiveModel);
  }

  @override
  bool operator ==(Object other) {
    return QuoteHiveModelMapper.ensureInitialized()
        .equalsValue(this as QuoteHiveModel, other);
  }

  @override
  int get hashCode {
    return QuoteHiveModelMapper.ensureInitialized()
        .hashValue(this as QuoteHiveModel);
  }
}

extension QuoteHiveModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuoteHiveModel, $Out> {
  QuoteHiveModelCopyWith<$R, QuoteHiveModel, $Out> get $asQuoteHiveModel =>
      $base.as((v, t, t2) => _QuoteHiveModelCopyWithImpl(v, t, t2));
}

abstract class QuoteHiveModelCopyWith<$R, $In extends QuoteHiveModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? category,
      String? quote,
      String? author,
      String? id,
      DateTime? createdAt});
  QuoteHiveModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _QuoteHiveModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuoteHiveModel, $Out>
    implements QuoteHiveModelCopyWith<$R, QuoteHiveModel, $Out> {
  _QuoteHiveModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuoteHiveModel> $mapper =
      QuoteHiveModelMapper.ensureInitialized();
  @override
  $R call(
          {String? category,
          String? quote,
          String? author,
          String? id,
          DateTime? createdAt}) =>
      $apply(FieldCopyWithData({
        if (category != null) #category: category,
        if (quote != null) #quote: quote,
        if (author != null) #author: author,
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt
      }));
  @override
  QuoteHiveModel $make(CopyWithData data) => QuoteHiveModel(
      category: data.get(#category, or: $value.category),
      quote: data.get(#quote, or: $value.quote),
      author: data.get(#author, or: $value.author),
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  QuoteHiveModelCopyWith<$R2, QuoteHiveModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuoteHiveModelCopyWithImpl($value, $cast, t);
}
