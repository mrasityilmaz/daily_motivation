// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'theme_configuration_model.dart';

class ThemeConfigurationModelMapper
    extends ClassMapperBase<ThemeConfigurationModel> {
  ThemeConfigurationModelMapper._();

  static ThemeConfigurationModelMapper? _instance;
  static ThemeConfigurationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ThemeConfigurationModelMapper._());
      MapperContainer.globals.useAll([ColorMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'ThemeConfigurationModel';

  static String _$backgroundPath(ThemeConfigurationModel v) => v.backgroundPath;
  static const Field<ThemeConfigurationModel, String> _f$backgroundPath =
      Field('backgroundPath', _$backgroundPath);
  static String _$fontName(ThemeConfigurationModel v) => v.fontName;
  static const Field<ThemeConfigurationModel, String> _f$fontName =
      Field('fontName', _$fontName);
  static double _$maxFontSize(ThemeConfigurationModel v) => v.maxFontSize;
  static const Field<ThemeConfigurationModel, double> _f$maxFontSize =
      Field('maxFontSize', _$maxFontSize);
  static double _$minFontSize(ThemeConfigurationModel v) => v.minFontSize;
  static const Field<ThemeConfigurationModel, double> _f$minFontSize =
      Field('minFontSize', _$minFontSize);
  static Color _$textColor(ThemeConfigurationModel v) => v.textColor;
  static const Field<ThemeConfigurationModel, Color> _f$textColor =
      Field('textColor', _$textColor);

  @override
  final MappableFields<ThemeConfigurationModel> fields = const {
    #backgroundPath: _f$backgroundPath,
    #fontName: _f$fontName,
    #maxFontSize: _f$maxFontSize,
    #minFontSize: _f$minFontSize,
    #textColor: _f$textColor,
  };

  static ThemeConfigurationModel _instantiate(DecodingData data) {
    return ThemeConfigurationModel(
        backgroundPath: data.dec(_f$backgroundPath),
        fontName: data.dec(_f$fontName),
        maxFontSize: data.dec(_f$maxFontSize),
        minFontSize: data.dec(_f$minFontSize),
        textColor: data.dec(_f$textColor));
  }

  @override
  final Function instantiate = _instantiate;

  static ThemeConfigurationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThemeConfigurationModel>(map);
  }

  static ThemeConfigurationModel fromJson(String json) {
    return ensureInitialized().decodeJson<ThemeConfigurationModel>(json);
  }
}

mixin ThemeConfigurationModelMappable {
  String toJson() {
    return ThemeConfigurationModelMapper.ensureInitialized()
        .encodeJson<ThemeConfigurationModel>(this as ThemeConfigurationModel);
  }

  Map<String, dynamic> toMap() {
    return ThemeConfigurationModelMapper.ensureInitialized()
        .encodeMap<ThemeConfigurationModel>(this as ThemeConfigurationModel);
  }

  ThemeConfigurationModelCopyWith<ThemeConfigurationModel,
          ThemeConfigurationModel, ThemeConfigurationModel>
      get copyWith => _ThemeConfigurationModelCopyWithImpl(
          this as ThemeConfigurationModel, $identity, $identity);
  @override
  String toString() {
    return ThemeConfigurationModelMapper.ensureInitialized()
        .stringifyValue(this as ThemeConfigurationModel);
  }

  @override
  bool operator ==(Object other) {
    return ThemeConfigurationModelMapper.ensureInitialized()
        .equalsValue(this as ThemeConfigurationModel, other);
  }

  @override
  int get hashCode {
    return ThemeConfigurationModelMapper.ensureInitialized()
        .hashValue(this as ThemeConfigurationModel);
  }
}

extension ThemeConfigurationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ThemeConfigurationModel, $Out> {
  ThemeConfigurationModelCopyWith<$R, ThemeConfigurationModel, $Out>
      get $asThemeConfigurationModel => $base
          .as((v, t, t2) => _ThemeConfigurationModelCopyWithImpl(v, t, t2));
}

abstract class ThemeConfigurationModelCopyWith<
    $R,
    $In extends ThemeConfigurationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? backgroundPath,
      String? fontName,
      double? maxFontSize,
      double? minFontSize,
      Color? textColor});
  ThemeConfigurationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ThemeConfigurationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ThemeConfigurationModel, $Out>
    implements
        ThemeConfigurationModelCopyWith<$R, ThemeConfigurationModel, $Out> {
  _ThemeConfigurationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ThemeConfigurationModel> $mapper =
      ThemeConfigurationModelMapper.ensureInitialized();
  @override
  $R call(
          {String? backgroundPath,
          String? fontName,
          double? maxFontSize,
          double? minFontSize,
          Color? textColor}) =>
      $apply(FieldCopyWithData({
        if (backgroundPath != null) #backgroundPath: backgroundPath,
        if (fontName != null) #fontName: fontName,
        if (maxFontSize != null) #maxFontSize: maxFontSize,
        if (minFontSize != null) #minFontSize: minFontSize,
        if (textColor != null) #textColor: textColor
      }));
  @override
  ThemeConfigurationModel $make(CopyWithData data) => ThemeConfigurationModel(
      backgroundPath: data.get(#backgroundPath, or: $value.backgroundPath),
      fontName: data.get(#fontName, or: $value.fontName),
      maxFontSize: data.get(#maxFontSize, or: $value.maxFontSize),
      minFontSize: data.get(#minFontSize, or: $value.minFontSize),
      textColor: data.get(#textColor, or: $value.textColor));

  @override
  ThemeConfigurationModelCopyWith<$R2, ThemeConfigurationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ThemeConfigurationModelCopyWithImpl($value, $cast, t);
}
