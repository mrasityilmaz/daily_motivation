// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generate_token_model.dart';

class GenerateTokenModelMapper extends ClassMapperBase<GenerateTokenModel> {
  GenerateTokenModelMapper._();

  static GenerateTokenModelMapper? _instance;
  static GenerateTokenModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenerateTokenModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GenerateTokenModel';

  static String _$deviceId(GenerateTokenModel v) => v.deviceId;
  static const Field<GenerateTokenModel, String> _f$deviceId =
      Field('deviceId', _$deviceId);

  @override
  final MappableFields<GenerateTokenModel> fields = const {
    #deviceId: _f$deviceId,
  };

  static GenerateTokenModel _instantiate(DecodingData data) {
    return GenerateTokenModel(data.dec(_f$deviceId));
  }

  @override
  final Function instantiate = _instantiate;

  static GenerateTokenModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GenerateTokenModel>(map);
  }

  static GenerateTokenModel fromJson(String json) {
    return ensureInitialized().decodeJson<GenerateTokenModel>(json);
  }
}

mixin GenerateTokenModelMappable {
  String toJson() {
    return GenerateTokenModelMapper.ensureInitialized()
        .encodeJson<GenerateTokenModel>(this as GenerateTokenModel);
  }

  Map<String, dynamic> toMap() {
    return GenerateTokenModelMapper.ensureInitialized()
        .encodeMap<GenerateTokenModel>(this as GenerateTokenModel);
  }

  GenerateTokenModelCopyWith<GenerateTokenModel, GenerateTokenModel,
          GenerateTokenModel>
      get copyWith => _GenerateTokenModelCopyWithImpl(
          this as GenerateTokenModel, $identity, $identity);
  @override
  String toString() {
    return GenerateTokenModelMapper.ensureInitialized()
        .stringifyValue(this as GenerateTokenModel);
  }

  @override
  bool operator ==(Object other) {
    return GenerateTokenModelMapper.ensureInitialized()
        .equalsValue(this as GenerateTokenModel, other);
  }

  @override
  int get hashCode {
    return GenerateTokenModelMapper.ensureInitialized()
        .hashValue(this as GenerateTokenModel);
  }
}

extension GenerateTokenModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GenerateTokenModel, $Out> {
  GenerateTokenModelCopyWith<$R, GenerateTokenModel, $Out>
      get $asGenerateTokenModel =>
          $base.as((v, t, t2) => _GenerateTokenModelCopyWithImpl(v, t, t2));
}

abstract class GenerateTokenModelCopyWith<$R, $In extends GenerateTokenModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? deviceId});
  GenerateTokenModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GenerateTokenModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GenerateTokenModel, $Out>
    implements GenerateTokenModelCopyWith<$R, GenerateTokenModel, $Out> {
  _GenerateTokenModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GenerateTokenModel> $mapper =
      GenerateTokenModelMapper.ensureInitialized();
  @override
  $R call({String? deviceId}) =>
      $apply(FieldCopyWithData({if (deviceId != null) #deviceId: deviceId}));
  @override
  GenerateTokenModel $make(CopyWithData data) =>
      GenerateTokenModel(data.get(#deviceId, or: $value.deviceId));

  @override
  GenerateTokenModelCopyWith<$R2, GenerateTokenModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GenerateTokenModelCopyWithImpl($value, $cast, t);
}
