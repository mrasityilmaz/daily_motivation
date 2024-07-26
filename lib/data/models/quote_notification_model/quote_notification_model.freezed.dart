// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuoteNotificationModel _$QuoteNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _QuoteNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteNotificationModel {
  String get notificationId => throw _privateConstructorUsedError;
  List<Categories> get notificationCategories =>
      throw _privateConstructorUsedError;
  List<int> get notificationDaysInWeek => throw _privateConstructorUsedError;
  QuoteNotificationEqualScheduleModel? get notificationEqualSchedule =>
      throw _privateConstructorUsedError;
  QuoteNotificationScheduleCustomIntervalModel?
      get notificationCustomIntervalSchedule =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteNotificationModelCopyWith<QuoteNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteNotificationModelCopyWith<$Res> {
  factory $QuoteNotificationModelCopyWith(QuoteNotificationModel value,
          $Res Function(QuoteNotificationModel) then) =
      _$QuoteNotificationModelCopyWithImpl<$Res, QuoteNotificationModel>;
  @useResult
  $Res call(
      {String notificationId,
      List<Categories> notificationCategories,
      List<int> notificationDaysInWeek,
      QuoteNotificationEqualScheduleModel? notificationEqualSchedule,
      QuoteNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});

  $QuoteNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule;
  $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule;
}

/// @nodoc
class _$QuoteNotificationModelCopyWithImpl<$Res,
        $Val extends QuoteNotificationModel>
    implements $QuoteNotificationModelCopyWith<$Res> {
  _$QuoteNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? notificationCategories = null,
    Object? notificationDaysInWeek = null,
    Object? notificationEqualSchedule = freezed,
    Object? notificationCustomIntervalSchedule = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationCategories: null == notificationCategories
          ? _value.notificationCategories
          : notificationCategories // ignore: cast_nullable_to_non_nullable
              as List<Categories>,
      notificationDaysInWeek: null == notificationDaysInWeek
          ? _value.notificationDaysInWeek
          : notificationDaysInWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notificationEqualSchedule: freezed == notificationEqualSchedule
          ? _value.notificationEqualSchedule
          : notificationEqualSchedule // ignore: cast_nullable_to_non_nullable
              as QuoteNotificationEqualScheduleModel?,
      notificationCustomIntervalSchedule: freezed ==
              notificationCustomIntervalSchedule
          ? _value.notificationCustomIntervalSchedule
          : notificationCustomIntervalSchedule // ignore: cast_nullable_to_non_nullable
              as QuoteNotificationScheduleCustomIntervalModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule {
    if (_value.notificationEqualSchedule == null) {
      return null;
    }

    return $QuoteNotificationEqualScheduleModelCopyWith<$Res>(
        _value.notificationEqualSchedule!, (value) {
      return _then(_value.copyWith(notificationEqualSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule {
    if (_value.notificationCustomIntervalSchedule == null) {
      return null;
    }

    return $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res>(
        _value.notificationCustomIntervalSchedule!, (value) {
      return _then(
          _value.copyWith(notificationCustomIntervalSchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteNotificationModelImplCopyWith<$Res>
    implements $QuoteNotificationModelCopyWith<$Res> {
  factory _$$QuoteNotificationModelImplCopyWith(
          _$QuoteNotificationModelImpl value,
          $Res Function(_$QuoteNotificationModelImpl) then) =
      __$$QuoteNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      List<Categories> notificationCategories,
      List<int> notificationDaysInWeek,
      QuoteNotificationEqualScheduleModel? notificationEqualSchedule,
      QuoteNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});

  @override
  $QuoteNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule;
  @override
  $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule;
}

/// @nodoc
class __$$QuoteNotificationModelImplCopyWithImpl<$Res>
    extends _$QuoteNotificationModelCopyWithImpl<$Res,
        _$QuoteNotificationModelImpl>
    implements _$$QuoteNotificationModelImplCopyWith<$Res> {
  __$$QuoteNotificationModelImplCopyWithImpl(
      _$QuoteNotificationModelImpl _value,
      $Res Function(_$QuoteNotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? notificationCategories = null,
    Object? notificationDaysInWeek = null,
    Object? notificationEqualSchedule = freezed,
    Object? notificationCustomIntervalSchedule = freezed,
  }) {
    return _then(_$QuoteNotificationModelImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationCategories: null == notificationCategories
          ? _value._notificationCategories
          : notificationCategories // ignore: cast_nullable_to_non_nullable
              as List<Categories>,
      notificationDaysInWeek: null == notificationDaysInWeek
          ? _value._notificationDaysInWeek
          : notificationDaysInWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notificationEqualSchedule: freezed == notificationEqualSchedule
          ? _value.notificationEqualSchedule
          : notificationEqualSchedule // ignore: cast_nullable_to_non_nullable
              as QuoteNotificationEqualScheduleModel?,
      notificationCustomIntervalSchedule: freezed ==
              notificationCustomIntervalSchedule
          ? _value.notificationCustomIntervalSchedule
          : notificationCustomIntervalSchedule // ignore: cast_nullable_to_non_nullable
              as QuoteNotificationScheduleCustomIntervalModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteNotificationModelImpl extends _QuoteNotificationModel {
  const _$QuoteNotificationModelImpl(
      {required this.notificationId,
      required final List<Categories> notificationCategories,
      required final List<int> notificationDaysInWeek,
      required this.notificationEqualSchedule,
      required this.notificationCustomIntervalSchedule})
      : _notificationCategories = notificationCategories,
        _notificationDaysInWeek = notificationDaysInWeek,
        super._();

  factory _$QuoteNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteNotificationModelImplFromJson(json);

  @override
  final String notificationId;
  final List<Categories> _notificationCategories;
  @override
  List<Categories> get notificationCategories {
    if (_notificationCategories is EqualUnmodifiableListView)
      return _notificationCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationCategories);
  }

  final List<int> _notificationDaysInWeek;
  @override
  List<int> get notificationDaysInWeek {
    if (_notificationDaysInWeek is EqualUnmodifiableListView)
      return _notificationDaysInWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationDaysInWeek);
  }

  @override
  final QuoteNotificationEqualScheduleModel? notificationEqualSchedule;
  @override
  final QuoteNotificationScheduleCustomIntervalModel?
      notificationCustomIntervalSchedule;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteNotificationModelImplCopyWith<_$QuoteNotificationModelImpl>
      get copyWith => __$$QuoteNotificationModelImplCopyWithImpl<
          _$QuoteNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _QuoteNotificationModel extends QuoteNotificationModel {
  const factory _QuoteNotificationModel(
      {required final String notificationId,
      required final List<Categories> notificationCategories,
      required final List<int> notificationDaysInWeek,
      required final QuoteNotificationEqualScheduleModel?
          notificationEqualSchedule,
      required final QuoteNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule}) = _$QuoteNotificationModelImpl;
  const _QuoteNotificationModel._() : super._();

  factory _QuoteNotificationModel.fromJson(Map<String, dynamic> json) =
      _$QuoteNotificationModelImpl.fromJson;

  @override
  String get notificationId;
  @override
  List<Categories> get notificationCategories;
  @override
  List<int> get notificationDaysInWeek;
  @override
  QuoteNotificationEqualScheduleModel? get notificationEqualSchedule;
  @override
  QuoteNotificationScheduleCustomIntervalModel?
      get notificationCustomIntervalSchedule;
  @override
  @JsonKey(ignore: true)
  _$$QuoteNotificationModelImplCopyWith<_$QuoteNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuoteNotificationEqualScheduleModel
    _$QuoteNotificationEqualScheduleModelFromJson(Map<String, dynamic> json) {
  return _QuoteNotificationEqualScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteNotificationEqualScheduleModel {
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  TimeOfDay? get notificationStartTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  TimeOfDay? get notificationEndTime => throw _privateConstructorUsedError;
  int? get notificationInterval => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteNotificationEqualScheduleModelCopyWith<
          QuoteNotificationEqualScheduleModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteNotificationEqualScheduleModelCopyWith<$Res> {
  factory $QuoteNotificationEqualScheduleModelCopyWith(
          QuoteNotificationEqualScheduleModel value,
          $Res Function(QuoteNotificationEqualScheduleModel) then) =
      _$QuoteNotificationEqualScheduleModelCopyWithImpl<$Res,
          QuoteNotificationEqualScheduleModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      TimeOfDay? notificationStartTime,
      @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      TimeOfDay? notificationEndTime,
      int? notificationInterval,
      @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class _$QuoteNotificationEqualScheduleModelCopyWithImpl<$Res,
        $Val extends QuoteNotificationEqualScheduleModel>
    implements $QuoteNotificationEqualScheduleModelCopyWith<$Res> {
  _$QuoteNotificationEqualScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationStartTime = freezed,
    Object? notificationEndTime = freezed,
    Object? notificationInterval = freezed,
    Object? notificationSchedules = null,
  }) {
    return _then(_value.copyWith(
      notificationStartTime: freezed == notificationStartTime
          ? _value.notificationStartTime
          : notificationStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      notificationEndTime: freezed == notificationEndTime
          ? _value.notificationEndTime
          : notificationEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      notificationInterval: freezed == notificationInterval
          ? _value.notificationInterval
          : notificationInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationSchedules: null == notificationSchedules
          ? _value.notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteNotificationEqualScheduleModelImplCopyWith<$Res>
    implements $QuoteNotificationEqualScheduleModelCopyWith<$Res> {
  factory _$$QuoteNotificationEqualScheduleModelImplCopyWith(
          _$QuoteNotificationEqualScheduleModelImpl value,
          $Res Function(_$QuoteNotificationEqualScheduleModelImpl) then) =
      __$$QuoteNotificationEqualScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      TimeOfDay? notificationStartTime,
      @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      TimeOfDay? notificationEndTime,
      int? notificationInterval,
      @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class __$$QuoteNotificationEqualScheduleModelImplCopyWithImpl<$Res>
    extends _$QuoteNotificationEqualScheduleModelCopyWithImpl<$Res,
        _$QuoteNotificationEqualScheduleModelImpl>
    implements _$$QuoteNotificationEqualScheduleModelImplCopyWith<$Res> {
  __$$QuoteNotificationEqualScheduleModelImplCopyWithImpl(
      _$QuoteNotificationEqualScheduleModelImpl _value,
      $Res Function(_$QuoteNotificationEqualScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationStartTime = freezed,
    Object? notificationEndTime = freezed,
    Object? notificationInterval = freezed,
    Object? notificationSchedules = null,
  }) {
    return _then(_$QuoteNotificationEqualScheduleModelImpl(
      notificationStartTime: freezed == notificationStartTime
          ? _value.notificationStartTime
          : notificationStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      notificationEndTime: freezed == notificationEndTime
          ? _value.notificationEndTime
          : notificationEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      notificationInterval: freezed == notificationInterval
          ? _value.notificationInterval
          : notificationInterval // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationSchedules: null == notificationSchedules
          ? _value._notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteNotificationEqualScheduleModelImpl
    extends _QuoteNotificationEqualScheduleModel {
  const _$QuoteNotificationEqualScheduleModelImpl(
      {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      required this.notificationStartTime,
      @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      required this.notificationEndTime,
      required this.notificationInterval,
      @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      required final List<TimeOfDay> notificationSchedules})
      : _notificationSchedules = notificationSchedules,
        super._();

  factory _$QuoteNotificationEqualScheduleModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$QuoteNotificationEqualScheduleModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay? notificationStartTime;
  @override
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  final TimeOfDay? notificationEndTime;
  @override
  final int? notificationInterval;
  final List<TimeOfDay> _notificationSchedules;
  @override
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules {
    if (_notificationSchedules is EqualUnmodifiableListView)
      return _notificationSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationSchedules);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteNotificationEqualScheduleModelImplCopyWith<
          _$QuoteNotificationEqualScheduleModelImpl>
      get copyWith => __$$QuoteNotificationEqualScheduleModelImplCopyWithImpl<
          _$QuoteNotificationEqualScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteNotificationEqualScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _QuoteNotificationEqualScheduleModel
    extends QuoteNotificationEqualScheduleModel {
  const factory _QuoteNotificationEqualScheduleModel(
          {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
          required final TimeOfDay? notificationStartTime,
          @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
          required final TimeOfDay? notificationEndTime,
          required final int? notificationInterval,
          @JsonKey(
              fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
          required final List<TimeOfDay> notificationSchedules}) =
      _$QuoteNotificationEqualScheduleModelImpl;
  const _QuoteNotificationEqualScheduleModel._() : super._();

  factory _QuoteNotificationEqualScheduleModel.fromJson(
          Map<String, dynamic> json) =
      _$QuoteNotificationEqualScheduleModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  TimeOfDay? get notificationStartTime;
  @override
  @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
  TimeOfDay? get notificationEndTime;
  @override
  int? get notificationInterval;
  @override
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules;
  @override
  @JsonKey(ignore: true)
  _$$QuoteNotificationEqualScheduleModelImplCopyWith<
          _$QuoteNotificationEqualScheduleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuoteNotificationScheduleCustomIntervalModel
    _$QuoteNotificationScheduleCustomIntervalModelFromJson(
        Map<String, dynamic> json) {
  return _QuoteNotificationScheduleCustomIntervalModel.fromJson(json);
}

/// @nodoc
mixin _$QuoteNotificationScheduleCustomIntervalModel {
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteNotificationScheduleCustomIntervalModelCopyWith<
          QuoteNotificationScheduleCustomIntervalModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  factory $QuoteNotificationScheduleCustomIntervalModelCopyWith(
          QuoteNotificationScheduleCustomIntervalModel value,
          $Res Function(QuoteNotificationScheduleCustomIntervalModel) then) =
      _$QuoteNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
          QuoteNotificationScheduleCustomIntervalModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class _$QuoteNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
        $Val extends QuoteNotificationScheduleCustomIntervalModel>
    implements $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  _$QuoteNotificationScheduleCustomIntervalModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationSchedules = null,
  }) {
    return _then(_value.copyWith(
      notificationSchedules: null == notificationSchedules
          ? _value.notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuoteNotificationScheduleCustomIntervalModelImplCopyWith<$Res>
    implements $QuoteNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  factory _$$QuoteNotificationScheduleCustomIntervalModelImplCopyWith(
          _$QuoteNotificationScheduleCustomIntervalModelImpl value,
          $Res Function(_$QuoteNotificationScheduleCustomIntervalModelImpl)
              then) =
      __$$QuoteNotificationScheduleCustomIntervalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class __$$QuoteNotificationScheduleCustomIntervalModelImplCopyWithImpl<$Res>
    extends _$QuoteNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
        _$QuoteNotificationScheduleCustomIntervalModelImpl>
    implements
        _$$QuoteNotificationScheduleCustomIntervalModelImplCopyWith<$Res> {
  __$$QuoteNotificationScheduleCustomIntervalModelImplCopyWithImpl(
      _$QuoteNotificationScheduleCustomIntervalModelImpl _value,
      $Res Function(_$QuoteNotificationScheduleCustomIntervalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationSchedules = null,
  }) {
    return _then(_$QuoteNotificationScheduleCustomIntervalModelImpl(
      notificationSchedules: null == notificationSchedules
          ? _value._notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteNotificationScheduleCustomIntervalModelImpl
    extends _QuoteNotificationScheduleCustomIntervalModel {
  const _$QuoteNotificationScheduleCustomIntervalModelImpl(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      required final List<TimeOfDay> notificationSchedules})
      : _notificationSchedules = notificationSchedules,
        super._();

  factory _$QuoteNotificationScheduleCustomIntervalModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$QuoteNotificationScheduleCustomIntervalModelImplFromJson(json);

  final List<TimeOfDay> _notificationSchedules;
  @override
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules {
    if (_notificationSchedules is EqualUnmodifiableListView)
      return _notificationSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationSchedules);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteNotificationScheduleCustomIntervalModelImplCopyWith<
          _$QuoteNotificationScheduleCustomIntervalModelImpl>
      get copyWith =>
          __$$QuoteNotificationScheduleCustomIntervalModelImplCopyWithImpl<
                  _$QuoteNotificationScheduleCustomIntervalModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteNotificationScheduleCustomIntervalModelImplToJson(
      this,
    );
  }
}

abstract class _QuoteNotificationScheduleCustomIntervalModel
    extends QuoteNotificationScheduleCustomIntervalModel {
  const factory _QuoteNotificationScheduleCustomIntervalModel(
          {@JsonKey(
              fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
          required final List<TimeOfDay> notificationSchedules}) =
      _$QuoteNotificationScheduleCustomIntervalModelImpl;
  const _QuoteNotificationScheduleCustomIntervalModel._() : super._();

  factory _QuoteNotificationScheduleCustomIntervalModel.fromJson(
          Map<String, dynamic> json) =
      _$QuoteNotificationScheduleCustomIntervalModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules;
  @override
  @JsonKey(ignore: true)
  _$$QuoteNotificationScheduleCustomIntervalModelImplCopyWith<
          _$QuoteNotificationScheduleCustomIntervalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
