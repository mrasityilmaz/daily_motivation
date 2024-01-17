// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_hive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteHiveModel _$QuoteHiveModelFromJson(Map<String, dynamic> json) {
  return _QuoteHiveModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteHiveModel {
  String get category => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteHiveModelCopyWith<QuoteHiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteHiveModelCopyWith<$Res> {
  factory $QuoteHiveModelCopyWith(
          QuoteHiveModel value, $Res Function(QuoteHiveModel) then) =
      _$QuoteHiveModelCopyWithImpl<$Res, QuoteHiveModel>;
  @useResult
  $Res call(
      {String category,
      String quote,
      String author,
      String id,
      DateTime createdAt});
}

/// @nodoc
class _$QuoteHiveModelCopyWithImpl<$Res, $Val extends QuoteHiveModel>
    implements $QuoteHiveModelCopyWith<$Res> {
  _$QuoteHiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? quote = null,
    Object? author = null,
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteHiveModelImplCopyWith<$Res>
    implements $QuoteHiveModelCopyWith<$Res> {
  factory _$$QuoteHiveModelImplCopyWith(_$QuoteHiveModelImpl value,
          $Res Function(_$QuoteHiveModelImpl) then) =
      __$$QuoteHiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String quote,
      String author,
      String id,
      DateTime createdAt});
}

/// @nodoc
class __$$QuoteHiveModelImplCopyWithImpl<$Res>
    extends _$QuoteHiveModelCopyWithImpl<$Res, _$QuoteHiveModelImpl>
    implements _$$QuoteHiveModelImplCopyWith<$Res> {
  __$$QuoteHiveModelImplCopyWithImpl(
      _$QuoteHiveModelImpl _value, $Res Function(_$QuoteHiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? quote = null,
    Object? author = null,
    Object? id = null,
    Object? createdAt = null,
  }) {
    return _then(_$QuoteHiveModelImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteHiveModelImpl extends _QuoteHiveModel {
  const _$QuoteHiveModelImpl(
      {required this.category,
      required this.quote,
      required this.author,
      required this.id,
      required this.createdAt})
      : super._();

  factory _$QuoteHiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteHiveModelImplFromJson(json);

  @override
  final String category;
  @override
  final String quote;
  @override
  final String author;
  @override
  final String id;
  @override
  final DateTime createdAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteHiveModelImplCopyWith<_$QuoteHiveModelImpl> get copyWith =>
      __$$QuoteHiveModelImplCopyWithImpl<_$QuoteHiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteHiveModelImplToJson(
      this,
    );
  }
}

abstract class _QuoteHiveModel extends QuoteHiveModel {
  const factory _QuoteHiveModel(
      {required final String category,
      required final String quote,
      required final String author,
      required final String id,
      required final DateTime createdAt}) = _$QuoteHiveModelImpl;
  const _QuoteHiveModel._() : super._();

  factory _QuoteHiveModel.fromJson(Map<String, dynamic> json) =
      _$QuoteHiveModelImpl.fromJson;

  @override
  String get category;
  @override
  String get quote;
  @override
  String get author;
  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$QuoteHiveModelImplCopyWith<_$QuoteHiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
