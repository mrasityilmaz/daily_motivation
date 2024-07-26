// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_configuration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeConfigurationModel _$ThemeConfigurationModelFromJson(
    Map<String, dynamic> json) {
  return _ThemeConfigurationModel.fromJson(json);
}

/// @nodoc
mixin _$ThemeConfigurationModel {
  String get backgroundPath => throw _privateConstructorUsedError;
  String get fontName => throw _privateConstructorUsedError;
  double get maxFontSize => throw _privateConstructorUsedError;
  double get minFontSize => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intToColor, toJson: _colorToInt)
  Color get textColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeConfigurationModelCopyWith<ThemeConfigurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeConfigurationModelCopyWith<$Res> {
  factory $ThemeConfigurationModelCopyWith(ThemeConfigurationModel value,
          $Res Function(ThemeConfigurationModel) then) =
      _$ThemeConfigurationModelCopyWithImpl<$Res, ThemeConfigurationModel>;
  @useResult
  $Res call(
      {String backgroundPath,
      String fontName,
      double maxFontSize,
      double minFontSize,
      @JsonKey(fromJson: _intToColor, toJson: _colorToInt) Color textColor});
}

/// @nodoc
class _$ThemeConfigurationModelCopyWithImpl<$Res,
        $Val extends ThemeConfigurationModel>
    implements $ThemeConfigurationModelCopyWith<$Res> {
  _$ThemeConfigurationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundPath = null,
    Object? fontName = null,
    Object? maxFontSize = null,
    Object? minFontSize = null,
    Object? textColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundPath: null == backgroundPath
          ? _value.backgroundPath
          : backgroundPath // ignore: cast_nullable_to_non_nullable
              as String,
      fontName: null == fontName
          ? _value.fontName
          : fontName // ignore: cast_nullable_to_non_nullable
              as String,
      maxFontSize: null == maxFontSize
          ? _value.maxFontSize
          : maxFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      minFontSize: null == minFontSize
          ? _value.minFontSize
          : minFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeConfigurationModelImplCopyWith<$Res>
    implements $ThemeConfigurationModelCopyWith<$Res> {
  factory _$$ThemeConfigurationModelImplCopyWith(
          _$ThemeConfigurationModelImpl value,
          $Res Function(_$ThemeConfigurationModelImpl) then) =
      __$$ThemeConfigurationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String backgroundPath,
      String fontName,
      double maxFontSize,
      double minFontSize,
      @JsonKey(fromJson: _intToColor, toJson: _colorToInt) Color textColor});
}

/// @nodoc
class __$$ThemeConfigurationModelImplCopyWithImpl<$Res>
    extends _$ThemeConfigurationModelCopyWithImpl<$Res,
        _$ThemeConfigurationModelImpl>
    implements _$$ThemeConfigurationModelImplCopyWith<$Res> {
  __$$ThemeConfigurationModelImplCopyWithImpl(
      _$ThemeConfigurationModelImpl _value,
      $Res Function(_$ThemeConfigurationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundPath = null,
    Object? fontName = null,
    Object? maxFontSize = null,
    Object? minFontSize = null,
    Object? textColor = null,
  }) {
    return _then(_$ThemeConfigurationModelImpl(
      backgroundPath: null == backgroundPath
          ? _value.backgroundPath
          : backgroundPath // ignore: cast_nullable_to_non_nullable
              as String,
      fontName: null == fontName
          ? _value.fontName
          : fontName // ignore: cast_nullable_to_non_nullable
              as String,
      maxFontSize: null == maxFontSize
          ? _value.maxFontSize
          : maxFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      minFontSize: null == minFontSize
          ? _value.minFontSize
          : minFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeConfigurationModelImpl extends _ThemeConfigurationModel {
  const _$ThemeConfigurationModelImpl(
      {required this.backgroundPath,
      required this.fontName,
      required this.maxFontSize,
      required this.minFontSize,
      @JsonKey(fromJson: _intToColor, toJson: _colorToInt)
      required this.textColor})
      : super._();

  factory _$ThemeConfigurationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeConfigurationModelImplFromJson(json);

  @override
  final String backgroundPath;
  @override
  final String fontName;
  @override
  final double maxFontSize;
  @override
  final double minFontSize;
  @override
  @JsonKey(fromJson: _intToColor, toJson: _colorToInt)
  final Color textColor;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeConfigurationModelImplCopyWith<_$ThemeConfigurationModelImpl>
      get copyWith => __$$ThemeConfigurationModelImplCopyWithImpl<
          _$ThemeConfigurationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeConfigurationModelImplToJson(
      this,
    );
  }
}

abstract class _ThemeConfigurationModel extends ThemeConfigurationModel {
  const factory _ThemeConfigurationModel(
      {required final String backgroundPath,
      required final String fontName,
      required final double maxFontSize,
      required final double minFontSize,
      @JsonKey(fromJson: _intToColor, toJson: _colorToInt)
      required final Color textColor}) = _$ThemeConfigurationModelImpl;
  const _ThemeConfigurationModel._() : super._();

  factory _ThemeConfigurationModel.fromJson(Map<String, dynamic> json) =
      _$ThemeConfigurationModelImpl.fromJson;

  @override
  String get backgroundPath;
  @override
  String get fontName;
  @override
  double get maxFontSize;
  @override
  double get minFontSize;
  @override
  @JsonKey(fromJson: _intToColor, toJson: _colorToInt)
  Color get textColor;
  @override
  @JsonKey(ignore: true)
  _$$ThemeConfigurationModelImplCopyWith<_$ThemeConfigurationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
