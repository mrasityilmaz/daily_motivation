// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quote_model.dart';

class QuoteModelMapper extends ClassMapperBase<QuoteModel> {
  QuoteModelMapper._();

  static QuoteModelMapper? _instance;
  static QuoteModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuoteModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'QuoteModel';

  static String _$category(QuoteModel v) => v.category;
  static const Field<QuoteModel, String> _f$category =
      Field('category', _$category);
  static String _$quote(QuoteModel v) => v.quote;
  static const Field<QuoteModel, String> _f$quote = Field('quote', _$quote);
  static String _$author(QuoteModel v) => v.author;
  static const Field<QuoteModel, String> _f$author = Field('author', _$author);
  static String _$id(QuoteModel v) => v.id;
  static const Field<QuoteModel, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<QuoteModel> fields = const {
    #category: _f$category,
    #quote: _f$quote,
    #author: _f$author,
    #id: _f$id,
  };

  static QuoteModel _instantiate(DecodingData data) {
    return QuoteModel(
        category: data.dec(_f$category),
        quote: data.dec(_f$quote),
        author: data.dec(_f$author),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static QuoteModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuoteModel>(map);
  }

  static QuoteModel fromJson(String json) {
    return ensureInitialized().decodeJson<QuoteModel>(json);
  }
}

mixin QuoteModelMappable {
  String toJson() {
    return QuoteModelMapper.ensureInitialized()
        .encodeJson<QuoteModel>(this as QuoteModel);
  }

  Map<String, dynamic> toMap() {
    return QuoteModelMapper.ensureInitialized()
        .encodeMap<QuoteModel>(this as QuoteModel);
  }

  QuoteModelCopyWith<QuoteModel, QuoteModel, QuoteModel> get copyWith =>
      _QuoteModelCopyWithImpl(this as QuoteModel, $identity, $identity);
  @override
  String toString() {
    return QuoteModelMapper.ensureInitialized()
        .stringifyValue(this as QuoteModel);
  }

  @override
  bool operator ==(Object other) {
    return QuoteModelMapper.ensureInitialized()
        .equalsValue(this as QuoteModel, other);
  }

  @override
  int get hashCode {
    return QuoteModelMapper.ensureInitialized().hashValue(this as QuoteModel);
  }
}

extension QuoteModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuoteModel, $Out> {
  QuoteModelCopyWith<$R, QuoteModel, $Out> get $asQuoteModel =>
      $base.as((v, t, t2) => _QuoteModelCopyWithImpl(v, t, t2));
}

abstract class QuoteModelCopyWith<$R, $In extends QuoteModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? category, String? quote, String? author, String? id});
  QuoteModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuoteModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuoteModel, $Out>
    implements QuoteModelCopyWith<$R, QuoteModel, $Out> {
  _QuoteModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuoteModel> $mapper =
      QuoteModelMapper.ensureInitialized();
  @override
  $R call({String? category, String? quote, String? author, String? id}) =>
      $apply(FieldCopyWithData({
        if (category != null) #category: category,
        if (quote != null) #quote: quote,
        if (author != null) #author: author,
        if (id != null) #id: id
      }));
  @override
  QuoteModel $make(CopyWithData data) => QuoteModel(
      category: data.get(#category, or: $value.category),
      quote: data.get(#quote, or: $value.quote),
      author: data.get(#author, or: $value.author),
      id: data.get(#id, or: $value.id));

  @override
  QuoteModelCopyWith<$R2, QuoteModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuoteModelCopyWithImpl($value, $cast, t);
}
