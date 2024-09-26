// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_schedule_times_model.dart';

class UserNotificationScheduleTimesMapper
    extends ClassMapperBase<UserNotificationScheduleTimes> {
  UserNotificationScheduleTimesMapper._();

  static UserNotificationScheduleTimesMapper? _instance;
  static UserNotificationScheduleTimesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UserNotificationScheduleTimesMapper._());
      ScheduleTimeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserNotificationScheduleTimes';

  static List<WeekdayEnum> _$whichDaysOfWeek(UserNotificationScheduleTimes v) =>
      v.whichDaysOfWeek;
  static const Field<UserNotificationScheduleTimes, List<WeekdayEnum>>
      _f$whichDaysOfWeek = Field('whichDaysOfWeek', _$whichDaysOfWeek);
  static List<TimeOfDay> _$whichTimesOfDay(UserNotificationScheduleTimes v) =>
      v.whichTimesOfDay;
  static const Field<UserNotificationScheduleTimes, List<TimeOfDay>>
      _f$whichTimesOfDay = Field('whichTimesOfDay', _$whichTimesOfDay);

  @override
  final MappableFields<UserNotificationScheduleTimes> fields = const {
    #whichDaysOfWeek: _f$whichDaysOfWeek,
    #whichTimesOfDay: _f$whichTimesOfDay,
  };

  static UserNotificationScheduleTimes _instantiate(DecodingData data) {
    return UserNotificationScheduleTimes(
        whichDaysOfWeek: data.dec(_f$whichDaysOfWeek),
        whichTimesOfDay: data.dec(_f$whichTimesOfDay));
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
        .encodeJson<UserNotificationScheduleTimes>(
            this as UserNotificationScheduleTimes);
  }

  Map<String, dynamic> toMap() {
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .encodeMap<UserNotificationScheduleTimes>(
            this as UserNotificationScheduleTimes);
  }

  UserNotificationScheduleTimesCopyWith<UserNotificationScheduleTimes,
          UserNotificationScheduleTimes, UserNotificationScheduleTimes>
      get copyWith => _UserNotificationScheduleTimesCopyWithImpl(
          this as UserNotificationScheduleTimes, $identity, $identity);
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
    return UserNotificationScheduleTimesMapper.ensureInitialized()
        .hashValue(this as UserNotificationScheduleTimes);
  }
}

extension UserNotificationScheduleTimesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserNotificationScheduleTimes, $Out> {
  UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes, $Out>
      get $asUserNotificationScheduleTimes => $base.as(
          (v, t, t2) => _UserNotificationScheduleTimesCopyWithImpl(v, t, t2));
}

abstract class UserNotificationScheduleTimesCopyWith<
    $R,
    $In extends UserNotificationScheduleTimes,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, WeekdayEnum, ObjectCopyWith<$R, WeekdayEnum, WeekdayEnum>>
      get whichDaysOfWeek;
  ListCopyWith<$R, TimeOfDay, ScheduleTimeCopyWith<$R, TimeOfDay, TimeOfDay>>
      get whichTimesOfDay;
  $R call(
      {List<WeekdayEnum>? whichDaysOfWeek, List<TimeOfDay>? whichTimesOfDay});
  UserNotificationScheduleTimesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserNotificationScheduleTimesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserNotificationScheduleTimes, $Out>
    implements
        UserNotificationScheduleTimesCopyWith<$R, UserNotificationScheduleTimes,
            $Out> {
  _UserNotificationScheduleTimesCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserNotificationScheduleTimes> $mapper =
      UserNotificationScheduleTimesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, WeekdayEnum, ObjectCopyWith<$R, WeekdayEnum, WeekdayEnum>>
      get whichDaysOfWeek => ListCopyWith(
          $value.whichDaysOfWeek,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(whichDaysOfWeek: v));
  @override
  ListCopyWith<$R, TimeOfDay, ScheduleTimeCopyWith<$R, TimeOfDay, TimeOfDay>>
      get whichTimesOfDay => ListCopyWith($value.whichTimesOfDay,
          (v, t) => v.copyWith.$chain(t), (v) => call(whichTimesOfDay: v));
  @override
  $R call(
          {List<WeekdayEnum>? whichDaysOfWeek,
          List<TimeOfDay>? whichTimesOfDay}) =>
      $apply(FieldCopyWithData({
        if (whichDaysOfWeek != null) #whichDaysOfWeek: whichDaysOfWeek,
        if (whichTimesOfDay != null) #whichTimesOfDay: whichTimesOfDay
      }));
  @override
  UserNotificationScheduleTimes $make(CopyWithData data) =>
      UserNotificationScheduleTimes(
          whichDaysOfWeek:
              data.get(#whichDaysOfWeek, or: $value.whichDaysOfWeek),
          whichTimesOfDay:
              data.get(#whichTimesOfDay, or: $value.whichTimesOfDay));

  @override
  UserNotificationScheduleTimesCopyWith<$R2, UserNotificationScheduleTimes,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserNotificationScheduleTimesCopyWithImpl($value, $cast, t);
}

class ScheduleTimeMapper extends ClassMapperBase<TimeOfDay> {
  ScheduleTimeMapper._();

  static ScheduleTimeMapper? _instance;
  static ScheduleTimeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScheduleTimeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TimeOfDay';

  static int _$hour(TimeOfDay v) => v.hour;
  static const Field<TimeOfDay, int> _f$hour = Field('hour', _$hour);
  static int _$minute(TimeOfDay v) => v.minute;
  static const Field<TimeOfDay, int> _f$minute = Field('minute', _$minute);

  @override
  final MappableFields<TimeOfDay> fields = const {
    #hour: _f$hour,
    #minute: _f$minute,
  };

  static TimeOfDay _instantiate(DecodingData data) {
    return TimeOfDay(hour: data.dec(_f$hour), minute: data.dec(_f$minute));
  }

  @override
  final Function instantiate = _instantiate;

  static TimeOfDay fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimeOfDay>(map);
  }

  static TimeOfDay fromJson(String json) {
    return ensureInitialized().decodeJson<TimeOfDay>(json);
  }
}

extension ScheduleTimeMapperExtension on TimeOfDay {
  String toJson() {
    return ScheduleTimeMapper.ensureInitialized().encodeJson<TimeOfDay>(this);
  }

  Map<String, dynamic> toMap() {
    return ScheduleTimeMapper.ensureInitialized().encodeMap<TimeOfDay>(this);
  }

  ScheduleTimeCopyWith<TimeOfDay, TimeOfDay, TimeOfDay> get copyWith =>
      _ScheduleTimeCopyWithImpl(this, $identity, $identity);
}

extension ScheduleTimeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimeOfDay, $Out> {
  ScheduleTimeCopyWith<$R, TimeOfDay, $Out> get $asTimeOfDay =>
      $base.as((v, t, t2) => _ScheduleTimeCopyWithImpl(v, t, t2));
}

abstract class ScheduleTimeCopyWith<$R, $In extends TimeOfDay, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? hour, int? minute});
  ScheduleTimeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScheduleTimeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimeOfDay, $Out>
    implements ScheduleTimeCopyWith<$R, TimeOfDay, $Out> {
  _ScheduleTimeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimeOfDay> $mapper =
      ScheduleTimeMapper.ensureInitialized();
  @override
  $R call({int? hour, int? minute}) => $apply(FieldCopyWithData(
      {if (hour != null) #hour: hour, if (minute != null) #minute: minute}));
  @override
  TimeOfDay $make(CopyWithData data) => TimeOfDay(
      hour: data.get(#hour, or: $value.hour),
      minute: data.get(#minute, or: $value.minute));

  @override
  ScheduleTimeCopyWith<$R2, TimeOfDay, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ScheduleTimeCopyWithImpl($value, $cast, t);
}
