// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeConfigurationModelImpl _$$ThemeConfigurationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThemeConfigurationModelImpl(
      backgroundPath: json['backgroundPath'] as String,
      fontName: json['fontName'] as String,
      maxFontSize: (json['maxFontSize'] as num).toDouble(),
      minFontSize: (json['minFontSize'] as num).toDouble(),
      textColor: _intToColor(json['textColor']),
    );

Map<String, dynamic> _$$ThemeConfigurationModelImplToJson(
        _$ThemeConfigurationModelImpl instance) =>
    <String, dynamic>{
      'backgroundPath': instance.backgroundPath,
      'fontName': instance.fontName,
      'maxFontSize': instance.maxFontSize,
      'minFontSize': instance.minFontSize,
      'textColor': _colorToInt(instance.textColor),
    };
