// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
      UserNotificationScheduleTimesMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String _$uid(UserModel v) => v.uid;
  static const Field<UserModel, String> _f$uid = Field('uid', _$uid);
  static String _$deviceId(UserModel v) => v.deviceId;
  static const Field<UserModel, String> _f$deviceId =
      Field('deviceId', _$deviceId);
  static String? _$timeZone(UserModel v) => v.timeZone;
  static const Field<UserModel, String> _f$timeZone =
      Field('timeZone', _$timeZone, opt: true);
  static bool _$sendNotifications(UserModel v) => v.sendNotifications;
  static const Field<UserModel, bool> _f$sendNotifications =
      Field('sendNotifications', _$sendNotifications, opt: true, def: false);
  static String? _$deviceToken(UserModel v) => v.deviceToken;
  static const Field<UserModel, String> _f$deviceToken =
      Field('deviceToken', _$deviceToken, opt: true);
  static UserNotificationScheduleTimes? _$scheduleTimes(UserModel v) =>
      v.scheduleTimes;
  static const Field<UserModel, UserNotificationScheduleTimes>
      _f$scheduleTimes = Field('scheduleTimes', _$scheduleTimes, opt: true);
  static DateTime? _$lastScheduledDate(UserModel v) => v.lastScheduledDate;
  static const Field<UserModel, DateTime> _f$lastScheduledDate =
      Field('lastScheduledDate', _$lastScheduledDate, opt: true);

  @override
  final MappableFields<UserModel> fields = const {
    #uid: _f$uid,
    #deviceId: _f$deviceId,
    #timeZone: _f$timeZone,
    #sendNotifications: _f$sendNotifications,
    #deviceToken: _f$deviceToken,
    #scheduleTimes: _f$scheduleTimes,
    #lastScheduledDate: _f$lastScheduledDate,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        uid: data.dec(_f$uid),
        deviceId: data.dec(_f$deviceId),
        timeZone: data.dec(_f$timeZone),
        sendNotifications: data.dec(_f$sendNotifications),
        deviceToken: data.dec(_f$deviceToken),
        scheduleTimes: data.dec(_f$scheduleTimes),
        lastScheduledDate: data.dec(_f$lastScheduledDate));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl(this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes,
      UserNotificationScheduleTimes>? get scheduleTimes;
  $R call(
      {String? uid,
      String? deviceId,
      String? timeZone,
      bool? sendNotifications,
      String? deviceToken,
      UserNotificationScheduleTimes? scheduleTimes,
      DateTime? lastScheduledDate});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes,
          UserNotificationScheduleTimes>?
      get scheduleTimes =>
          $value.scheduleTimes?.copyWith.$chain((v) => call(scheduleTimes: v));
  @override
  $R call(
          {String? uid,
          String? deviceId,
          Object? timeZone = $none,
          bool? sendNotifications,
          Object? deviceToken = $none,
          Object? scheduleTimes = $none,
          Object? lastScheduledDate = $none}) =>
      $apply(FieldCopyWithData({
        if (uid != null) #uid: uid,
        if (deviceId != null) #deviceId: deviceId,
        if (timeZone != $none) #timeZone: timeZone,
        if (sendNotifications != null) #sendNotifications: sendNotifications,
        if (deviceToken != $none) #deviceToken: deviceToken,
        if (scheduleTimes != $none) #scheduleTimes: scheduleTimes,
        if (lastScheduledDate != $none) #lastScheduledDate: lastScheduledDate
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      uid: data.get(#uid, or: $value.uid),
      deviceId: data.get(#deviceId, or: $value.deviceId),
      timeZone: data.get(#timeZone, or: $value.timeZone),
      sendNotifications:
          data.get(#sendNotifications, or: $value.sendNotifications),
      deviceToken: data.get(#deviceToken, or: $value.deviceToken),
      scheduleTimes: data.get(#scheduleTimes, or: $value.scheduleTimes),
      lastScheduledDate:
          data.get(#lastScheduledDate, or: $value.lastScheduledDate));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl($value, $cast, t);
}
