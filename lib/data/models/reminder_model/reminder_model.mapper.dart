// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reminder_model.dart';

class ReminderModelMapper extends ClassMapperBase<ReminderModel> {
  ReminderModelMapper._();

  static ReminderModelMapper? _instance;
  static ReminderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReminderModelMapper._());
      ReminderNotificationEqualScheduleModelMapper.ensureInitialized();
      ReminderNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReminderModel';

  static String _$notificationId(ReminderModel v) => v.notificationId;
  static const Field<ReminderModel, String> _f$notificationId =
      Field('notificationId', _$notificationId);
  static String _$notificationTitle(ReminderModel v) => v.notificationTitle;
  static const Field<ReminderModel, String> _f$notificationTitle =
      Field('notificationTitle', _$notificationTitle);
  static String _$notificationBody(ReminderModel v) => v.notificationBody;
  static const Field<ReminderModel, String> _f$notificationBody =
      Field('notificationBody', _$notificationBody);
  static List<int> _$notificationDaysInWeek(ReminderModel v) =>
      v.notificationDaysInWeek;
  static const Field<ReminderModel, List<int>> _f$notificationDaysInWeek =
      Field('notificationDaysInWeek', _$notificationDaysInWeek);
  static ReminderNotificationEqualScheduleModel? _$notificationEqualSchedule(
          ReminderModel v) =>
      v.notificationEqualSchedule;
  static const Field<ReminderModel, ReminderNotificationEqualScheduleModel>
      _f$notificationEqualSchedule = Field(
          'notificationEqualSchedule', _$notificationEqualSchedule,
          opt: true);
  static ReminderNotificationScheduleCustomIntervalModel?
      _$notificationCustomIntervalSchedule(ReminderModel v) =>
          v.notificationCustomIntervalSchedule;
  static const Field<ReminderModel,
          ReminderNotificationScheduleCustomIntervalModel>
      _f$notificationCustomIntervalSchedule = Field(
          'notificationCustomIntervalSchedule',
          _$notificationCustomIntervalSchedule,
          opt: true);

  @override
  final MappableFields<ReminderModel> fields = const {
    #notificationId: _f$notificationId,
    #notificationTitle: _f$notificationTitle,
    #notificationBody: _f$notificationBody,
    #notificationDaysInWeek: _f$notificationDaysInWeek,
    #notificationEqualSchedule: _f$notificationEqualSchedule,
    #notificationCustomIntervalSchedule: _f$notificationCustomIntervalSchedule,
  };

  static ReminderModel _instantiate(DecodingData data) {
    return ReminderModel(
        notificationId: data.dec(_f$notificationId),
        notificationTitle: data.dec(_f$notificationTitle),
        notificationBody: data.dec(_f$notificationBody),
        notificationDaysInWeek: data.dec(_f$notificationDaysInWeek),
        notificationEqualSchedule: data.dec(_f$notificationEqualSchedule),
        notificationCustomIntervalSchedule:
            data.dec(_f$notificationCustomIntervalSchedule));
  }

  @override
  final Function instantiate = _instantiate;

  static ReminderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReminderModel>(map);
  }

  static ReminderModel fromJson(String json) {
    return ensureInitialized().decodeJson<ReminderModel>(json);
  }
}

mixin ReminderModelMappable {
  String toJson() {
    return ReminderModelMapper.ensureInitialized()
        .encodeJson<ReminderModel>(this as ReminderModel);
  }

  Map<String, dynamic> toMap() {
    return ReminderModelMapper.ensureInitialized()
        .encodeMap<ReminderModel>(this as ReminderModel);
  }

  ReminderModelCopyWith<ReminderModel, ReminderModel, ReminderModel>
      get copyWith => _ReminderModelCopyWithImpl(
          this as ReminderModel, $identity, $identity);
  @override
  String toString() {
    return ReminderModelMapper.ensureInitialized()
        .stringifyValue(this as ReminderModel);
  }

  @override
  bool operator ==(Object other) {
    return ReminderModelMapper.ensureInitialized()
        .equalsValue(this as ReminderModel, other);
  }

  @override
  int get hashCode {
    return ReminderModelMapper.ensureInitialized()
        .hashValue(this as ReminderModel);
  }
}

extension ReminderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReminderModel, $Out> {
  ReminderModelCopyWith<$R, ReminderModel, $Out> get $asReminderModel =>
      $base.as((v, t, t2) => _ReminderModelCopyWithImpl(v, t, t2));
}

abstract class ReminderModelCopyWith<$R, $In extends ReminderModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
      get notificationDaysInWeek;
  ReminderNotificationEqualScheduleModelCopyWith<
      $R,
      ReminderNotificationEqualScheduleModel,
      ReminderNotificationEqualScheduleModel>? get notificationEqualSchedule;
  ReminderNotificationScheduleCustomIntervalModelCopyWith<
          $R,
          ReminderNotificationScheduleCustomIntervalModel,
          ReminderNotificationScheduleCustomIntervalModel>?
      get notificationCustomIntervalSchedule;
  $R call(
      {String? notificationId,
      String? notificationTitle,
      String? notificationBody,
      List<int>? notificationDaysInWeek,
      ReminderNotificationEqualScheduleModel? notificationEqualSchedule,
      ReminderNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});
  ReminderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReminderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReminderModel, $Out>
    implements ReminderModelCopyWith<$R, ReminderModel, $Out> {
  _ReminderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReminderModel> $mapper =
      ReminderModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
      get notificationDaysInWeek => ListCopyWith(
          $value.notificationDaysInWeek,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(notificationDaysInWeek: v));
  @override
  ReminderNotificationEqualScheduleModelCopyWith<
          $R,
          ReminderNotificationEqualScheduleModel,
          ReminderNotificationEqualScheduleModel>?
      get notificationEqualSchedule =>
          $value.notificationEqualSchedule?.copyWith
              .$chain((v) => call(notificationEqualSchedule: v));
  @override
  ReminderNotificationScheduleCustomIntervalModelCopyWith<
          $R,
          ReminderNotificationScheduleCustomIntervalModel,
          ReminderNotificationScheduleCustomIntervalModel>?
      get notificationCustomIntervalSchedule =>
          $value.notificationCustomIntervalSchedule?.copyWith
              .$chain((v) => call(notificationCustomIntervalSchedule: v));
  @override
  $R call(
          {String? notificationId,
          String? notificationTitle,
          String? notificationBody,
          List<int>? notificationDaysInWeek,
          Object? notificationEqualSchedule = $none,
          Object? notificationCustomIntervalSchedule = $none}) =>
      $apply(FieldCopyWithData({
        if (notificationId != null) #notificationId: notificationId,
        if (notificationTitle != null) #notificationTitle: notificationTitle,
        if (notificationBody != null) #notificationBody: notificationBody,
        if (notificationDaysInWeek != null)
          #notificationDaysInWeek: notificationDaysInWeek,
        if (notificationEqualSchedule != $none)
          #notificationEqualSchedule: notificationEqualSchedule,
        if (notificationCustomIntervalSchedule != $none)
          #notificationCustomIntervalSchedule:
              notificationCustomIntervalSchedule
      }));
  @override
  ReminderModel $make(CopyWithData data) => ReminderModel(
      notificationId: data.get(#notificationId, or: $value.notificationId),
      notificationTitle:
          data.get(#notificationTitle, or: $value.notificationTitle),
      notificationBody:
          data.get(#notificationBody, or: $value.notificationBody),
      notificationDaysInWeek:
          data.get(#notificationDaysInWeek, or: $value.notificationDaysInWeek),
      notificationEqualSchedule: data.get(#notificationEqualSchedule,
          or: $value.notificationEqualSchedule),
      notificationCustomIntervalSchedule: data.get(
          #notificationCustomIntervalSchedule,
          or: $value.notificationCustomIntervalSchedule));

  @override
  ReminderModelCopyWith<$R2, ReminderModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReminderModelCopyWithImpl($value, $cast, t);
}

class ReminderNotificationEqualScheduleModelMapper
    extends ClassMapperBase<ReminderNotificationEqualScheduleModel> {
  ReminderNotificationEqualScheduleModelMapper._();

  static ReminderNotificationEqualScheduleModelMapper? _instance;
  static ReminderNotificationEqualScheduleModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReminderNotificationEqualScheduleModelMapper._());
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'ReminderNotificationEqualScheduleModel';

  static List<TimeOfDay> _$notificationSchedules(
          ReminderNotificationEqualScheduleModel v) =>
      v.notificationSchedules;
  static const Field<ReminderNotificationEqualScheduleModel, List<TimeOfDay>>
      _f$notificationSchedules =
      Field('notificationSchedules', _$notificationSchedules);
  static TimeOfDay? _$notificationStartTime(
          ReminderNotificationEqualScheduleModel v) =>
      v.notificationStartTime;
  static const Field<ReminderNotificationEqualScheduleModel, TimeOfDay>
      _f$notificationStartTime =
      Field('notificationStartTime', _$notificationStartTime, opt: true);
  static TimeOfDay? _$notificationEndTime(
          ReminderNotificationEqualScheduleModel v) =>
      v.notificationEndTime;
  static const Field<ReminderNotificationEqualScheduleModel, TimeOfDay>
      _f$notificationEndTime =
      Field('notificationEndTime', _$notificationEndTime, opt: true);
  static int? _$notificationInterval(
          ReminderNotificationEqualScheduleModel v) =>
      v.notificationInterval;
  static const Field<ReminderNotificationEqualScheduleModel, int>
      _f$notificationInterval =
      Field('notificationInterval', _$notificationInterval, opt: true);

  @override
  final MappableFields<ReminderNotificationEqualScheduleModel> fields = const {
    #notificationSchedules: _f$notificationSchedules,
    #notificationStartTime: _f$notificationStartTime,
    #notificationEndTime: _f$notificationEndTime,
    #notificationInterval: _f$notificationInterval,
  };

  static ReminderNotificationEqualScheduleModel _instantiate(
      DecodingData data) {
    return ReminderNotificationEqualScheduleModel(
        notificationSchedules: data.dec(_f$notificationSchedules),
        notificationStartTime: data.dec(_f$notificationStartTime),
        notificationEndTime: data.dec(_f$notificationEndTime),
        notificationInterval: data.dec(_f$notificationInterval));
  }

  @override
  final Function instantiate = _instantiate;

  static ReminderNotificationEqualScheduleModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReminderNotificationEqualScheduleModel>(map);
  }

  static ReminderNotificationEqualScheduleModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReminderNotificationEqualScheduleModel>(json);
  }
}

mixin ReminderNotificationEqualScheduleModelMappable {
  String toJson() {
    return ReminderNotificationEqualScheduleModelMapper.ensureInitialized()
        .encodeJson<ReminderNotificationEqualScheduleModel>(
            this as ReminderNotificationEqualScheduleModel);
  }

  Map<String, dynamic> toMap() {
    return ReminderNotificationEqualScheduleModelMapper.ensureInitialized()
        .encodeMap<ReminderNotificationEqualScheduleModel>(
            this as ReminderNotificationEqualScheduleModel);
  }

  ReminderNotificationEqualScheduleModelCopyWith<
          ReminderNotificationEqualScheduleModel,
          ReminderNotificationEqualScheduleModel,
          ReminderNotificationEqualScheduleModel>
      get copyWith => _ReminderNotificationEqualScheduleModelCopyWithImpl(
          this as ReminderNotificationEqualScheduleModel, $identity, $identity);
  @override
  String toString() {
    return ReminderNotificationEqualScheduleModelMapper.ensureInitialized()
        .stringifyValue(this as ReminderNotificationEqualScheduleModel);
  }

  @override
  bool operator ==(Object other) {
    return ReminderNotificationEqualScheduleModelMapper.ensureInitialized()
        .equalsValue(this as ReminderNotificationEqualScheduleModel, other);
  }

  @override
  int get hashCode {
    return ReminderNotificationEqualScheduleModelMapper.ensureInitialized()
        .hashValue(this as ReminderNotificationEqualScheduleModel);
  }
}

extension ReminderNotificationEqualScheduleModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReminderNotificationEqualScheduleModel, $Out> {
  ReminderNotificationEqualScheduleModelCopyWith<$R,
          ReminderNotificationEqualScheduleModel, $Out>
      get $asReminderNotificationEqualScheduleModel => $base.as((v, t, t2) =>
          _ReminderNotificationEqualScheduleModelCopyWithImpl(v, t, t2));
}

abstract class ReminderNotificationEqualScheduleModelCopyWith<
    $R,
    $In extends ReminderNotificationEqualScheduleModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules;
  $R call(
      {List<TimeOfDay>? notificationSchedules,
      TimeOfDay? notificationStartTime,
      TimeOfDay? notificationEndTime,
      int? notificationInterval});
  ReminderNotificationEqualScheduleModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReminderNotificationEqualScheduleModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReminderNotificationEqualScheduleModel, $Out>
    implements
        ReminderNotificationEqualScheduleModelCopyWith<$R,
            ReminderNotificationEqualScheduleModel, $Out> {
  _ReminderNotificationEqualScheduleModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReminderNotificationEqualScheduleModel> $mapper =
      ReminderNotificationEqualScheduleModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules => ListCopyWith(
          $value.notificationSchedules,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(notificationSchedules: v));
  @override
  $R call(
          {List<TimeOfDay>? notificationSchedules,
          Object? notificationStartTime = $none,
          Object? notificationEndTime = $none,
          Object? notificationInterval = $none}) =>
      $apply(FieldCopyWithData({
        if (notificationSchedules != null)
          #notificationSchedules: notificationSchedules,
        if (notificationStartTime != $none)
          #notificationStartTime: notificationStartTime,
        if (notificationEndTime != $none)
          #notificationEndTime: notificationEndTime,
        if (notificationInterval != $none)
          #notificationInterval: notificationInterval
      }));
  @override
  ReminderNotificationEqualScheduleModel $make(CopyWithData data) =>
      ReminderNotificationEqualScheduleModel(
          notificationSchedules: data.get(#notificationSchedules,
              or: $value.notificationSchedules),
          notificationStartTime: data.get(#notificationStartTime,
              or: $value.notificationStartTime),
          notificationEndTime:
              data.get(#notificationEndTime, or: $value.notificationEndTime),
          notificationInterval:
              data.get(#notificationInterval, or: $value.notificationInterval));

  @override
  ReminderNotificationEqualScheduleModelCopyWith<$R2,
      ReminderNotificationEqualScheduleModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReminderNotificationEqualScheduleModelCopyWithImpl($value, $cast, t);
}

class ReminderNotificationScheduleCustomIntervalModelMapper
    extends ClassMapperBase<ReminderNotificationScheduleCustomIntervalModel> {
  ReminderNotificationScheduleCustomIntervalModelMapper._();

  static ReminderNotificationScheduleCustomIntervalModelMapper? _instance;
  static ReminderNotificationScheduleCustomIntervalModelMapper
      ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance =
          ReminderNotificationScheduleCustomIntervalModelMapper._());
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'ReminderNotificationScheduleCustomIntervalModel';

  static List<TimeOfDay> _$notificationSchedules(
          ReminderNotificationScheduleCustomIntervalModel v) =>
      v.notificationSchedules;
  static const Field<ReminderNotificationScheduleCustomIntervalModel,
          List<TimeOfDay>> _f$notificationSchedules =
      Field('notificationSchedules', _$notificationSchedules);

  @override
  final MappableFields<ReminderNotificationScheduleCustomIntervalModel> fields =
      const {
    #notificationSchedules: _f$notificationSchedules,
  };

  static ReminderNotificationScheduleCustomIntervalModel _instantiate(
      DecodingData data) {
    return ReminderNotificationScheduleCustomIntervalModel(
        notificationSchedules: data.dec(_f$notificationSchedules));
  }

  @override
  final Function instantiate = _instantiate;

  static ReminderNotificationScheduleCustomIntervalModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<ReminderNotificationScheduleCustomIntervalModel>(map);
  }

  static ReminderNotificationScheduleCustomIntervalModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<ReminderNotificationScheduleCustomIntervalModel>(json);
  }
}

mixin ReminderNotificationScheduleCustomIntervalModelMappable {
  String toJson() {
    return ReminderNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .encodeJson<ReminderNotificationScheduleCustomIntervalModel>(
            this as ReminderNotificationScheduleCustomIntervalModel);
  }

  Map<String, dynamic> toMap() {
    return ReminderNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .encodeMap<ReminderNotificationScheduleCustomIntervalModel>(
            this as ReminderNotificationScheduleCustomIntervalModel);
  }

  ReminderNotificationScheduleCustomIntervalModelCopyWith<
          ReminderNotificationScheduleCustomIntervalModel,
          ReminderNotificationScheduleCustomIntervalModel,
          ReminderNotificationScheduleCustomIntervalModel>
      get copyWith =>
          _ReminderNotificationScheduleCustomIntervalModelCopyWithImpl(
              this as ReminderNotificationScheduleCustomIntervalModel,
              $identity,
              $identity);
  @override
  String toString() {
    return ReminderNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .stringifyValue(
            this as ReminderNotificationScheduleCustomIntervalModel);
  }

  @override
  bool operator ==(Object other) {
    return ReminderNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .equalsValue(
            this as ReminderNotificationScheduleCustomIntervalModel, other);
  }

  @override
  int get hashCode {
    return ReminderNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .hashValue(this as ReminderNotificationScheduleCustomIntervalModel);
  }
}

extension ReminderNotificationScheduleCustomIntervalModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReminderNotificationScheduleCustomIntervalModel,
        $Out> {
  ReminderNotificationScheduleCustomIntervalModelCopyWith<$R,
          ReminderNotificationScheduleCustomIntervalModel, $Out>
      get $asReminderNotificationScheduleCustomIntervalModel =>
          $base.as((v, t, t2) =>
              _ReminderNotificationScheduleCustomIntervalModelCopyWithImpl(
                  v, t, t2));
}

abstract class ReminderNotificationScheduleCustomIntervalModelCopyWith<
    $R,
    $In extends ReminderNotificationScheduleCustomIntervalModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules;
  $R call({List<TimeOfDay>? notificationSchedules});
  ReminderNotificationScheduleCustomIntervalModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReminderNotificationScheduleCustomIntervalModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R,
        ReminderNotificationScheduleCustomIntervalModel, $Out>
    implements
        ReminderNotificationScheduleCustomIntervalModelCopyWith<$R,
            ReminderNotificationScheduleCustomIntervalModel, $Out> {
  _ReminderNotificationScheduleCustomIntervalModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReminderNotificationScheduleCustomIntervalModel>
      $mapper =
      ReminderNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules => ListCopyWith(
          $value.notificationSchedules,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(notificationSchedules: v));
  @override
  $R call({List<TimeOfDay>? notificationSchedules}) =>
      $apply(FieldCopyWithData({
        if (notificationSchedules != null)
          #notificationSchedules: notificationSchedules
      }));
  @override
  ReminderNotificationScheduleCustomIntervalModel $make(CopyWithData data) =>
      ReminderNotificationScheduleCustomIntervalModel(
          notificationSchedules: data.get(#notificationSchedules,
              or: $value.notificationSchedules));

  @override
  ReminderNotificationScheduleCustomIntervalModelCopyWith<$R2,
          ReminderNotificationScheduleCustomIntervalModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReminderNotificationScheduleCustomIntervalModelCopyWithImpl(
              $value, $cast, t);
}
