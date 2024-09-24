// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_schedule_times_model.dart';

class UserNotificationScheduleTimesMapper extends ClassMapperBase<UserNotificationScheduleTimes> {
  UserNotificationScheduleTimesMapper._();

  static UserNotificationScheduleTimesMapper? _instance;
  static UserNotificationScheduleTimesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserNotificationScheduleTimesMapper._());
      WeekdayEnumMapper.ensureInitialized();
      ScheduleTimeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserNotificationScheduleTimes';

  static List<WeekdayEnum> _$whichDaysOfWeek(UserNotificationScheduleTimes v) => v.whichDaysOfWeek;
  static const Field<UserNotificationScheduleTimes, List<WeekdayEnum>> _f$whichDaysOfWeek =
      Field('whichDaysOfWeek', _$whichDaysOfWeek);
  static List<ScheduleTime> _$whichTimesOfDay(UserNotificationScheduleTimes v) => v.whichTimesOfDay;
  static const Field<UserNotificationScheduleTimes, List<ScheduleTime>> _f$whichTimesOfDay =
      Field('whichTimesOfDay', _$whichTimesOfDay);

  @override
  final MappableFields<UserNotificationScheduleTimes> fields = const {
    #whichDaysOfWeek: _f$whichDaysOfWeek,
    #whichTimesOfDay: _f$whichTimesOfDay,
  };

  static UserNotificationScheduleTimes _instantiate(DecodingData data) {
    return UserNotificationScheduleTimes(
        whichDaysOfWeek: data.dec(_f$whichDaysOfWeek), whichTimesOfDay: data.dec(_f$whichTimesOfDay));
  }

  @override
  final Function instantiate = _instantiate;

  static UserNotificationScheduleTimes fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserNotificationScheduleTimes>(map);
  }

  static UserNotificationScheduleTimes fromJson(String json) {
    return ensureInitialized().decodeJson<UserNotificationScheduleTimes>(json);
  }
}

mixin UserNotificationScheduleTimesMappable {
  String toJson() {
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .encodeJson<UserNotificationScheduleTimes>(this as UserNotificationScheduleTimes);
  }

  Map<String, dynamic> toMap() {
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .encodeMap<UserNotificationScheduleTimes>(this as UserNotificationScheduleTimes);
  }

  UserNotificationScheduleTimesCopyWith<UserNotificationScheduleTimes, UserNotificationScheduleTimes,
          UserNotificationScheduleTimes>
      get copyWith =>
          _UserNotificationScheduleTimesCopyWithImpl(this as UserNotificationScheduleTimes, $identity, $identity);
  @override
  String toString() {
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .stringifyValue(this as UserNotificationScheduleTimes);
  }

  @override
  bool operator ==(Object other) {
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .equalsValue(this as UserNotificationScheduleTimes, other);
  }

  @override
  int get hashCode {
    return UserNotificationScheduleTimesMapper.ensureInitialized().hashValue(this as UserNotificationScheduleTimes);
  }
}

extension UserNotificationScheduleTimesValueCopy<$R, $Out> on ObjectCopyWith<$R, UserNotificationScheduleTimes, $Out> {
  UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes, $Out> get $asUserNotificationScheduleTimes =>
      $base.as((v, t, t2) => _UserNotificationScheduleTimesCopyWithImpl(v, t, t2));
}

abstract class UserNotificationScheduleTimesCopyWith<$R, $In extends UserNotificationScheduleTimes, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, WeekdayEnum, ObjectCopyWith<$R, WeekdayEnum, WeekdayEnum>> get whichDaysOfWeek;
  ListCopyWith<$R, ScheduleTime, ObjectCopyWith<$R, ScheduleTime, ScheduleTime>> get whichTimesOfDay;
  $R call({List<WeekdayEnum>? whichDaysOfWeek, List<ScheduleTime>? whichTimesOfDay});
  UserNotificationScheduleTimesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserNotificationScheduleTimesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserNotificationScheduleTimes, $Out>
    implements UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes, $Out> {
  _UserNotificationScheduleTimesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserNotificationScheduleTimes> $mapper =
      UserNotificationScheduleTimesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, WeekdayEnum, ObjectCopyWith<$R, WeekdayEnum, WeekdayEnum>> get whichDaysOfWeek =>
      ListCopyWith($value.whichDaysOfWeek, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(whichDaysOfWeek: v));
  @override
  ListCopyWith<$R, ScheduleTime, ObjectCopyWith<$R, ScheduleTime, ScheduleTime>> get whichTimesOfDay =>
      ListCopyWith($value.whichTimesOfDay, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(whichTimesOfDay: v));
  @override
  $R call({List<WeekdayEnum>? whichDaysOfWeek, List<ScheduleTime>? whichTimesOfDay}) => $apply(FieldCopyWithData({
        if (whichDaysOfWeek != null) #whichDaysOfWeek: whichDaysOfWeek,
        if (whichTimesOfDay != null) #whichTimesOfDay: whichTimesOfDay
      }));
  @override
  UserNotificationScheduleTimes $make(CopyWithData data) => UserNotificationScheduleTimes(
      whichDaysOfWeek: data.get(#whichDaysOfWeek, or: $value.whichDaysOfWeek),
      whichTimesOfDay: data.get(#whichTimesOfDay, or: $value.whichTimesOfDay));

  @override
  UserNotificationScheduleTimesCopyWith<$R2, UserNotificationScheduleTimes, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserNotificationScheduleTimesCopyWithImpl($value, $cast, t);
}

class ScheduleTimeMapper extends RecordMapperBase<ScheduleTime> {
  static ScheduleTimeMapper? _instance;
  ScheduleTimeMapper._();

  static ScheduleTimeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScheduleTimeMapper._());
      MapperBase.addType<void>(<A, B>(f) => f<({A hour, B minute})>());
    }
    return _instance!;
  }

  static Uint8 _$hour(ScheduleTime v) => v.hour;
  static const Field<ScheduleTime, Uint8> _f$hour = Field('hour', _$hour);
  static Uint8 _$minute(ScheduleTime v) => v.minute;
  static const Field<ScheduleTime, Uint8> _f$minute = Field('minute', _$minute);

  @override
  final MappableFields<ScheduleTime> fields = const {
    #hour: _f$hour,
    #minute: _f$minute,
  };

  @override
  Function get typeFactory => (f) => f<ScheduleTime>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  static ScheduleTime _instantiate(DecodingData<ScheduleTime> data) {
    return (hour: data.dec(_f$hour), minute: data.dec(_f$minute));
  }

  @override
  final Function instantiate = _instantiate;

  static ScheduleTime fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScheduleTime>(map);
  }

  static ScheduleTime fromJson(String json) {
    return ensureInitialized().decodeJson<ScheduleTime>(json);
  }
}

extension ScheduleTimeMappable on ScheduleTime {
  Map<String, dynamic> toMap() {
    return ScheduleTimeMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return ScheduleTimeMapper.ensureInitialized().encodeJson(this);
  }

  ScheduleTimeCopyWith<ScheduleTime> get copyWith => _ScheduleTimeCopyWithImpl(this, $identity, $identity);
}

extension ScheduleTimeValueCopy<$R> on ObjectCopyWith<$R, ScheduleTime, ScheduleTime> {
  ScheduleTimeCopyWith<$R> get $asScheduleTime => $base.as((v, t, t2) => _ScheduleTimeCopyWithImpl(v, t, t2));
}

abstract class ScheduleTimeCopyWith<$R> implements RecordCopyWith<$R, ScheduleTime> {
  $R call({Uint8? hour, Uint8? minute});
  ScheduleTimeCopyWith<$R2> $chain<$R2>(Then<ScheduleTime, $R2> t);
}

class _ScheduleTimeCopyWithImpl<$R> extends RecordCopyWithBase<$R, ScheduleTime> implements ScheduleTimeCopyWith<$R> {
  _ScheduleTimeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<ScheduleTime> $mapper = ScheduleTimeMapper.ensureInitialized();
  @override
  $R call({Uint8? hour, Uint8? minute}) =>
      $apply(FieldCopyWithData({if (hour != null) #hour: hour, if (minute != null) #minute: minute}));
  @override
  ScheduleTime $make(CopyWithData data) =>
      (hour: data.get(#hour, or: $value.hour), minute: data.get(#minute, or: $value.minute));

  @override
  ScheduleTimeCopyWith<$R2> $chain<$R2>(Then<ScheduleTime, $R2> t) => _ScheduleTimeCopyWithImpl($value, $cast, t);
}
