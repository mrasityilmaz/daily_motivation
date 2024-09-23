// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quote_notification_model.dart';

class QuoteNotificationModelMapper
    extends ClassMapperBase<QuoteNotificationModel> {
  QuoteNotificationModelMapper._();

  static QuoteNotificationModelMapper? _instance;
  static QuoteNotificationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuoteNotificationModelMapper._());
      QuoteNotificationEqualScheduleModelMapper.ensureInitialized();
      QuoteNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuoteNotificationModel';

  static String _$notificationId(QuoteNotificationModel v) => v.notificationId;
  static const Field<QuoteNotificationModel, String> _f$notificationId =
      Field('notificationId', _$notificationId);
  static List<Categories> _$notificationCategories(QuoteNotificationModel v) =>
      v.notificationCategories;
  static const Field<QuoteNotificationModel, List<Categories>>
      _f$notificationCategories =
      Field('notificationCategories', _$notificationCategories);
  static List<int> _$notificationDaysInWeek(QuoteNotificationModel v) =>
      v.notificationDaysInWeek;
  static const Field<QuoteNotificationModel, List<int>>
      _f$notificationDaysInWeek =
      Field('notificationDaysInWeek', _$notificationDaysInWeek);
  static QuoteNotificationEqualScheduleModel? _$notificationEqualSchedule(
          QuoteNotificationModel v) =>
      v.notificationEqualSchedule;
  static const Field<QuoteNotificationModel,
          QuoteNotificationEqualScheduleModel> _f$notificationEqualSchedule =
      Field('notificationEqualSchedule', _$notificationEqualSchedule,
          opt: true);
  static QuoteNotificationScheduleCustomIntervalModel?
      _$notificationCustomIntervalSchedule(QuoteNotificationModel v) =>
          v.notificationCustomIntervalSchedule;
  static const Field<QuoteNotificationModel,
          QuoteNotificationScheduleCustomIntervalModel>
      _f$notificationCustomIntervalSchedule = Field(
          'notificationCustomIntervalSchedule',
          _$notificationCustomIntervalSchedule,
          opt: true);

  @override
  final MappableFields<QuoteNotificationModel> fields = const {
    #notificationId: _f$notificationId,
    #notificationCategories: _f$notificationCategories,
    #notificationDaysInWeek: _f$notificationDaysInWeek,
    #notificationEqualSchedule: _f$notificationEqualSchedule,
    #notificationCustomIntervalSchedule: _f$notificationCustomIntervalSchedule,
  };

  static QuoteNotificationModel _instantiate(DecodingData data) {
    return QuoteNotificationModel(
        notificationId: data.dec(_f$notificationId),
        notificationCategories: data.dec(_f$notificationCategories),
        notificationDaysInWeek: data.dec(_f$notificationDaysInWeek),
        notificationEqualSchedule: data.dec(_f$notificationEqualSchedule),
        notificationCustomIntervalSchedule:
            data.dec(_f$notificationCustomIntervalSchedule));
  }

  @override
  final Function instantiate = _instantiate;

  static QuoteNotificationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuoteNotificationModel>(map);
  }

  static QuoteNotificationModel fromJson(String json) {
    return ensureInitialized().decodeJson<QuoteNotificationModel>(json);
  }
}

mixin QuoteNotificationModelMappable {
  String toJson() {
    return QuoteNotificationModelMapper.ensureInitialized()
        .encodeJson<QuoteNotificationModel>(this as QuoteNotificationModel);
  }

  Map<String, dynamic> toMap() {
    return QuoteNotificationModelMapper.ensureInitialized()
        .encodeMap<QuoteNotificationModel>(this as QuoteNotificationModel);
  }

  QuoteNotificationModelCopyWith<QuoteNotificationModel, QuoteNotificationModel,
          QuoteNotificationModel>
      get copyWith => _QuoteNotificationModelCopyWithImpl(
          this as QuoteNotificationModel, $identity, $identity);
  @override
  String toString() {
    return QuoteNotificationModelMapper.ensureInitialized()
        .stringifyValue(this as QuoteNotificationModel);
  }

  @override
  bool operator ==(Object other) {
    return QuoteNotificationModelMapper.ensureInitialized()
        .equalsValue(this as QuoteNotificationModel, other);
  }

  @override
  int get hashCode {
    return QuoteNotificationModelMapper.ensureInitialized()
        .hashValue(this as QuoteNotificationModel);
  }
}

extension QuoteNotificationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuoteNotificationModel, $Out> {
  QuoteNotificationModelCopyWith<$R, QuoteNotificationModel, $Out>
      get $asQuoteNotificationModel =>
          $base.as((v, t, t2) => _QuoteNotificationModelCopyWithImpl(v, t, t2));
}

abstract class QuoteNotificationModelCopyWith<
    $R,
    $In extends QuoteNotificationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Categories, ObjectCopyWith<$R, Categories, Categories>>
      get notificationCategories;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
      get notificationDaysInWeek;
  QuoteNotificationEqualScheduleModelCopyWith<
      $R,
      QuoteNotificationEqualScheduleModel,
      QuoteNotificationEqualScheduleModel>? get notificationEqualSchedule;
  QuoteNotificationScheduleCustomIntervalModelCopyWith<
          $R,
          QuoteNotificationScheduleCustomIntervalModel,
          QuoteNotificationScheduleCustomIntervalModel>?
      get notificationCustomIntervalSchedule;
  $R call(
      {String? notificationId,
      List<Categories>? notificationCategories,
      List<int>? notificationDaysInWeek,
      QuoteNotificationEqualScheduleModel? notificationEqualSchedule,
      QuoteNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});
  QuoteNotificationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _QuoteNotificationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuoteNotificationModel, $Out>
    implements
        QuoteNotificationModelCopyWith<$R, QuoteNotificationModel, $Out> {
  _QuoteNotificationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuoteNotificationModel> $mapper =
      QuoteNotificationModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Categories, ObjectCopyWith<$R, Categories, Categories>>
      get notificationCategories => ListCopyWith(
          $value.notificationCategories,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(notificationCategories: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
      get notificationDaysInWeek => ListCopyWith(
          $value.notificationDaysInWeek,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(notificationDaysInWeek: v));
  @override
  QuoteNotificationEqualScheduleModelCopyWith<
          $R,
          QuoteNotificationEqualScheduleModel,
          QuoteNotificationEqualScheduleModel>?
      get notificationEqualSchedule =>
          $value.notificationEqualSchedule?.copyWith
              .$chain((v) => call(notificationEqualSchedule: v));
  @override
  QuoteNotificationScheduleCustomIntervalModelCopyWith<
          $R,
          QuoteNotificationScheduleCustomIntervalModel,
          QuoteNotificationScheduleCustomIntervalModel>?
      get notificationCustomIntervalSchedule =>
          $value.notificationCustomIntervalSchedule?.copyWith
              .$chain((v) => call(notificationCustomIntervalSchedule: v));
  @override
  $R call(
          {String? notificationId,
          List<Categories>? notificationCategories,
          List<int>? notificationDaysInWeek,
          Object? notificationEqualSchedule = $none,
          Object? notificationCustomIntervalSchedule = $none}) =>
      $apply(FieldCopyWithData({
        if (notificationId != null) #notificationId: notificationId,
        if (notificationCategories != null)
          #notificationCategories: notificationCategories,
        if (notificationDaysInWeek != null)
          #notificationDaysInWeek: notificationDaysInWeek,
        if (notificationEqualSchedule != $none)
          #notificationEqualSchedule: notificationEqualSchedule,
        if (notificationCustomIntervalSchedule != $none)
          #notificationCustomIntervalSchedule:
              notificationCustomIntervalSchedule
      }));
  @override
  QuoteNotificationModel $make(CopyWithData data) => QuoteNotificationModel(
      notificationId: data.get(#notificationId, or: $value.notificationId),
      notificationCategories:
          data.get(#notificationCategories, or: $value.notificationCategories),
      notificationDaysInWeek:
          data.get(#notificationDaysInWeek, or: $value.notificationDaysInWeek),
      notificationEqualSchedule: data.get(#notificationEqualSchedule,
          or: $value.notificationEqualSchedule),
      notificationCustomIntervalSchedule: data.get(
          #notificationCustomIntervalSchedule,
          or: $value.notificationCustomIntervalSchedule));

  @override
  QuoteNotificationModelCopyWith<$R2, QuoteNotificationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _QuoteNotificationModelCopyWithImpl($value, $cast, t);
}
