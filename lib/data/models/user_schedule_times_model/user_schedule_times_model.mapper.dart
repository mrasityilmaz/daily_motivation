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
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
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
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get whichTimesOfDay => ListCopyWith(
          $value.whichTimesOfDay,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(whichTimesOfDay: v));
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
