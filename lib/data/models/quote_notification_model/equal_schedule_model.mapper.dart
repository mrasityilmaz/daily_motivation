// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'equal_schedule_model.dart';

class QuoteNotificationEqualScheduleModelMapper
    extends ClassMapperBase<QuoteNotificationEqualScheduleModel> {
  QuoteNotificationEqualScheduleModelMapper._();

  static QuoteNotificationEqualScheduleModelMapper? _instance;
  static QuoteNotificationEqualScheduleModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = QuoteNotificationEqualScheduleModelMapper._());
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'QuoteNotificationEqualScheduleModel';

  static List<TimeOfDay> _$notificationSchedules(
          QuoteNotificationEqualScheduleModel v) =>
      v.notificationSchedules;
  static const Field<QuoteNotificationEqualScheduleModel, List<TimeOfDay>>
      _f$notificationSchedules =
      Field('notificationSchedules', _$notificationSchedules);
  static TimeOfDay? _$notificationStartTime(
          QuoteNotificationEqualScheduleModel v) =>
      v.notificationStartTime;
  static const Field<QuoteNotificationEqualScheduleModel, TimeOfDay>
      _f$notificationStartTime =
      Field('notificationStartTime', _$notificationStartTime, opt: true);
  static TimeOfDay? _$notificationEndTime(
          QuoteNotificationEqualScheduleModel v) =>
      v.notificationEndTime;
  static const Field<QuoteNotificationEqualScheduleModel, TimeOfDay>
      _f$notificationEndTime =
      Field('notificationEndTime', _$notificationEndTime, opt: true);
  static int? _$notificationInterval(QuoteNotificationEqualScheduleModel v) =>
      v.notificationInterval;
  static const Field<QuoteNotificationEqualScheduleModel, int>
      _f$notificationInterval =
      Field('notificationInterval', _$notificationInterval, opt: true);

  @override
  final MappableFields<QuoteNotificationEqualScheduleModel> fields = const {
    #notificationSchedules: _f$notificationSchedules,
    #notificationStartTime: _f$notificationStartTime,
    #notificationEndTime: _f$notificationEndTime,
    #notificationInterval: _f$notificationInterval,
  };

  static QuoteNotificationEqualScheduleModel _instantiate(DecodingData data) {
    return QuoteNotificationEqualScheduleModel(
        notificationSchedules: data.dec(_f$notificationSchedules),
        notificationStartTime: data.dec(_f$notificationStartTime),
        notificationEndTime: data.dec(_f$notificationEndTime),
        notificationInterval: data.dec(_f$notificationInterval));
  }

  @override
  final Function instantiate = _instantiate;

  static QuoteNotificationEqualScheduleModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<QuoteNotificationEqualScheduleModel>(map);
  }

  static QuoteNotificationEqualScheduleModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<QuoteNotificationEqualScheduleModel>(json);
  }
}

mixin QuoteNotificationEqualScheduleModelMappable {
  String toJson() {
    return QuoteNotificationEqualScheduleModelMapper.ensureInitialized()
        .encodeJson<QuoteNotificationEqualScheduleModel>(
            this as QuoteNotificationEqualScheduleModel);
  }

  Map<String, dynamic> toMap() {
    return QuoteNotificationEqualScheduleModelMapper.ensureInitialized()
        .encodeMap<QuoteNotificationEqualScheduleModel>(
            this as QuoteNotificationEqualScheduleModel);
  }

  QuoteNotificationEqualScheduleModelCopyWith<
          QuoteNotificationEqualScheduleModel,
          QuoteNotificationEqualScheduleModel,
          QuoteNotificationEqualScheduleModel>
      get copyWith => _QuoteNotificationEqualScheduleModelCopyWithImpl(
          this as QuoteNotificationEqualScheduleModel, $identity, $identity);
  @override
  String toString() {
    return QuoteNotificationEqualScheduleModelMapper.ensureInitialized()
        .stringifyValue(this as QuoteNotificationEqualScheduleModel);
  }

  @override
  bool operator ==(Object other) {
    return QuoteNotificationEqualScheduleModelMapper.ensureInitialized()
        .equalsValue(this as QuoteNotificationEqualScheduleModel, other);
  }

  @override
  int get hashCode {
    return QuoteNotificationEqualScheduleModelMapper.ensureInitialized()
        .hashValue(this as QuoteNotificationEqualScheduleModel);
  }
}

extension QuoteNotificationEqualScheduleModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuoteNotificationEqualScheduleModel, $Out> {
  QuoteNotificationEqualScheduleModelCopyWith<$R,
          QuoteNotificationEqualScheduleModel, $Out>
      get $asQuoteNotificationEqualScheduleModel => $base.as((v, t, t2) =>
          _QuoteNotificationEqualScheduleModelCopyWithImpl(v, t, t2));
}

abstract class QuoteNotificationEqualScheduleModelCopyWith<
    $R,
    $In extends QuoteNotificationEqualScheduleModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules;
  $R call(
      {List<TimeOfDay>? notificationSchedules,
      TimeOfDay? notificationStartTime,
      TimeOfDay? notificationEndTime,
      int? notificationInterval});
  QuoteNotificationEqualScheduleModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuoteNotificationEqualScheduleModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuoteNotificationEqualScheduleModel, $Out>
    implements
        QuoteNotificationEqualScheduleModelCopyWith<$R,
            QuoteNotificationEqualScheduleModel, $Out> {
  _QuoteNotificationEqualScheduleModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuoteNotificationEqualScheduleModel> $mapper =
      QuoteNotificationEqualScheduleModelMapper.ensureInitialized();
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
  QuoteNotificationEqualScheduleModel $make(CopyWithData data) =>
      QuoteNotificationEqualScheduleModel(
          notificationSchedules: data.get(#notificationSchedules,
              or: $value.notificationSchedules),
          notificationStartTime: data.get(#notificationStartTime,
              or: $value.notificationStartTime),
          notificationEndTime:
              data.get(#notificationEndTime, or: $value.notificationEndTime),
          notificationInterval:
              data.get(#notificationInterval, or: $value.notificationInterval));

  @override
  QuoteNotificationEqualScheduleModelCopyWith<$R2,
      QuoteNotificationEqualScheduleModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuoteNotificationEqualScheduleModelCopyWithImpl($value, $cast, t);
}
