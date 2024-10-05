// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_session_model.dart';

class UserSessionModelMapper extends ClassMapperBase<UserSessionModel> {
  UserSessionModelMapper._();

  static UserSessionModelMapper? _instance;
  static UserSessionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSessionModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSessionModel';

  static String _$deviceId(UserSessionModel v) => v.deviceId;
  static const Field<UserSessionModel, String> _f$deviceId =
      Field('deviceId', _$deviceId);
  static DateTime _$lastLoginTime(UserSessionModel v) => v.lastLoginTime;
  static const Field<UserSessionModel, DateTime> _f$lastLoginTime =
      Field('lastLoginTime', _$lastLoginTime);
  static String? _$sessionToken(UserSessionModel v) => v.sessionToken;
  static const Field<UserSessionModel, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken, opt: true);

  @override
  final MappableFields<UserSessionModel> fields = const {
    #deviceId: _f$deviceId,
    #lastLoginTime: _f$lastLoginTime,
    #sessionToken: _f$sessionToken,
  };

  static UserSessionModel _instantiate(DecodingData data) {
    return UserSessionModel(
        deviceId: data.dec(_f$deviceId),
        lastLoginTime: data.dec(_f$lastLoginTime),
        sessionToken: data.dec(_f$sessionToken));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSessionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSessionModel>(map);
  }

  static UserSessionModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserSessionModel>(json);
  }
}

mixin UserSessionModelMappable {
  String toJson() {
    return UserSessionModelMapper.ensureInitialized()
        .encodeJson<UserSessionModel>(this as UserSessionModel);
  }

  Map<String, dynamic> toMap() {
    return UserSessionModelMapper.ensureInitialized()
        .encodeMap<UserSessionModel>(this as UserSessionModel);
  }

  UserSessionModelCopyWith<UserSessionModel, UserSessionModel, UserSessionModel>
      get copyWith => _UserSessionModelCopyWithImpl(
          this as UserSessionModel, $identity, $identity);
  @override
  String toString() {
    return UserSessionModelMapper.ensureInitialized()
        .stringifyValue(this as UserSessionModel);
  }

  @override
  bool operator ==(Object other) {
    return UserSessionModelMapper.ensureInitialized()
        .equalsValue(this as UserSessionModel, other);
  }

  @override
  int get hashCode {
    return UserSessionModelMapper.ensureInitialized()
        .hashValue(this as UserSessionModel);
  }
}

extension UserSessionModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSessionModel, $Out> {
  UserSessionModelCopyWith<$R, UserSessionModel, $Out>
      get $asUserSessionModel =>
          $base.as((v, t, t2) => _UserSessionModelCopyWithImpl(v, t, t2));
}

abstract class UserSessionModelCopyWith<$R, $In extends UserSessionModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? deviceId, DateTime? lastLoginTime, String? sessionToken});
  UserSessionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSessionModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSessionModel, $Out>
    implements UserSessionModelCopyWith<$R, UserSessionModel, $Out> {
  _UserSessionModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSessionModel> $mapper =
      UserSessionModelMapper.ensureInitialized();
  @override
  $R call(
          {String? deviceId,
          DateTime? lastLoginTime,
          Object? sessionToken = $none}) =>
      $apply(FieldCopyWithData({
        if (deviceId != null) #deviceId: deviceId,
        if (lastLoginTime != null) #lastLoginTime: lastLoginTime,
        if (sessionToken != $none) #sessionToken: sessionToken
      }));
  @override
  UserSessionModel $make(CopyWithData data) => UserSessionModel(
      deviceId: data.get(#deviceId, or: $value.deviceId),
      lastLoginTime: data.get(#lastLoginTime, or: $value.lastLoginTime),
      sessionToken: data.get(#sessionToken, or: $value.sessionToken));

  @override
  UserSessionModelCopyWith<$R2, UserSessionModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSessionModelCopyWithImpl($value, $cast, t);
}
