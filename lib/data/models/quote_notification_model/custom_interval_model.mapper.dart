// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_interval_model.dart';

class QuoteNotificationScheduleCustomIntervalModelMapper
    extends ClassMapperBase<QuoteNotificationScheduleCustomIntervalModel> {
  QuoteNotificationScheduleCustomIntervalModelMapper._();

  static QuoteNotificationScheduleCustomIntervalModelMapper? _instance;
  static QuoteNotificationScheduleCustomIntervalModelMapper
      ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
          _instance = QuoteNotificationScheduleCustomIntervalModelMapper._());
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'QuoteNotificationScheduleCustomIntervalModel';

  static List<TimeOfDay> _$notificationSchedules(
          QuoteNotificationScheduleCustomIntervalModel v) =>
      v.notificationSchedules;
  static const Field<QuoteNotificationScheduleCustomIntervalModel,
          List<TimeOfDay>> _f$notificationSchedules =
      Field('notificationSchedules', _$notificationSchedules);

  @override
  final MappableFields<QuoteNotificationScheduleCustomIntervalModel> fields =
      const {
    #notificationSchedules: _f$notificationSchedules,
  };

  static QuoteNotificationScheduleCustomIntervalModel _instantiate(
      DecodingData data) {
    return QuoteNotificationScheduleCustomIntervalModel(
        notificationSchedules: data.dec(_f$notificationSchedules));
  }

  @override
  final Function instantiate = _instantiate;

  static QuoteNotificationScheduleCustomIntervalModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<QuoteNotificationScheduleCustomIntervalModel>(map);
  }

  static QuoteNotificationScheduleCustomIntervalModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<QuoteNotificationScheduleCustomIntervalModel>(json);
  }
}

mixin QuoteNotificationScheduleCustomIntervalModelMappable {
  String toJson() {
    return QuoteNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .encodeJson<QuoteNotificationScheduleCustomIntervalModel>(
            this as QuoteNotificationScheduleCustomIntervalModel);
  }

  Map<String, dynamic> toMap() {
    return QuoteNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .encodeMap<QuoteNotificationScheduleCustomIntervalModel>(
            this as QuoteNotificationScheduleCustomIntervalModel);
  }

  QuoteNotificationScheduleCustomIntervalModelCopyWith<
          QuoteNotificationScheduleCustomIntervalModel,
          QuoteNotificationScheduleCustomIntervalModel,
          QuoteNotificationScheduleCustomIntervalModel>
      get copyWith => _QuoteNotificationScheduleCustomIntervalModelCopyWithImpl(
          this as QuoteNotificationScheduleCustomIntervalModel,
          $identity,
          $identity);
  @override
  String toString() {
    return QuoteNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .stringifyValue(this as QuoteNotificationScheduleCustomIntervalModel);
  }

  @override
  bool operator ==(Object other) {
    return QuoteNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .equalsValue(
            this as QuoteNotificationScheduleCustomIntervalModel, other);
  }

  @override
  int get hashCode {
    return QuoteNotificationScheduleCustomIntervalModelMapper
            .ensureInitialized()
        .hashValue(this as QuoteNotificationScheduleCustomIntervalModel);
  }
}

extension QuoteNotificationScheduleCustomIntervalModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuoteNotificationScheduleCustomIntervalModel, $Out> {
  QuoteNotificationScheduleCustomIntervalModelCopyWith<
      $R,
      QuoteNotificationScheduleCustomIntervalModel,
      $Out> get $asQuoteNotificationScheduleCustomIntervalModel => $base.as((v,
          t, t2) =>
      _QuoteNotificationScheduleCustomIntervalModelCopyWithImpl(v, t, t2));
}

abstract class QuoteNotificationScheduleCustomIntervalModelCopyWith<
    $R,
    $In extends QuoteNotificationScheduleCustomIntervalModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationSchedules;
  $R call({List<TimeOfDay>? notificationSchedules});
  QuoteNotificationScheduleCustomIntervalModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuoteNotificationScheduleCustomIntervalModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuoteNotificationScheduleCustomIntervalModel,
        $Out>
    implements
        QuoteNotificationScheduleCustomIntervalModelCopyWith<$R,
            QuoteNotificationScheduleCustomIntervalModel, $Out> {
  _QuoteNotificationScheduleCustomIntervalModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuoteNotificationScheduleCustomIntervalModel>
      $mapper =
      QuoteNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
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
  QuoteNotificationScheduleCustomIntervalModel $make(CopyWithData data) =>
      QuoteNotificationScheduleCustomIntervalModel(
          notificationSchedules: data.get(#notificationSchedules,
              or: $value.notificationSchedules));

  @override
  QuoteNotificationScheduleCustomIntervalModelCopyWith<$R2,
      QuoteNotificationScheduleCustomIntervalModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuoteNotificationScheduleCustomIntervalModelCopyWithImpl(
          $value, $cast, t);
}
