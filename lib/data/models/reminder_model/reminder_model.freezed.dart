// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  String get notificationId => throw _privateConstructorUsedError;
  String get notificationTitle => throw _privateConstructorUsedError;
  String get notificationBody => throw _privateConstructorUsedError;
  List<int> get notificationDaysInWeek => throw _privateConstructorUsedError;
  ReminderNotificationEqualScheduleModel? get notificationEqualSchedule =>
      throw _privateConstructorUsedError;
  ReminderNotificationScheduleCustomIntervalModel?
      get notificationCustomIntervalSchedule =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderModelCopyWith<ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
          ReminderModel value, $Res Function(ReminderModel) then) =
      _$ReminderModelCopyWithImpl<$Res, ReminderModel>;
  @useResult
  $Res call(
      {String notificationId,
      String notificationTitle,
      String notificationBody,
      List<int> notificationDaysInWeek,
      ReminderNotificationEqualScheduleModel? notificationEqualSchedule,
      ReminderNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});

  $ReminderNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule;
  $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule;
}

/// @nodoc
class _$ReminderModelCopyWithImpl<$Res, $Val extends ReminderModel>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? notificationTitle = null,
    Object? notificationBody = null,
    Object? notificationDaysInWeek = null,
    Object? notificationEqualSchedule = freezed,
    Object? notificationCustomIntervalSchedule = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      notificationBody: null == notificationBody
          ? _value.notificationBody
          : notificationBody // ignore: cast_nullable_to_non_nullable
              as String,
      notificationDaysInWeek: null == notificationDaysInWeek
          ? _value.notificationDaysInWeek
          : notificationDaysInWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notificationEqualSchedule: freezed == notificationEqualSchedule
          ? _value.notificationEqualSchedule
          : notificationEqualSchedule // ignore: cast_nullable_to_non_nullable
              as ReminderNotificationEqualScheduleModel?,
      notificationCustomIntervalSchedule: freezed ==
              notificationCustomIntervalSchedule
          ? _value.notificationCustomIntervalSchedule
          : notificationCustomIntervalSchedule // ignore: cast_nullable_to_non_nullable
              as ReminderNotificationScheduleCustomIntervalModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReminderNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule {
    if (_value.notificationEqualSchedule == null) {
      return null;
    }

    return $ReminderNotificationEqualScheduleModelCopyWith<$Res>(
        _value.notificationEqualSchedule!, (value) {
      return _then(_value.copyWith(notificationEqualSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule {
    if (_value.notificationCustomIntervalSchedule == null) {
      return null;
    }

    return $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res>(
        _value.notificationCustomIntervalSchedule!, (value) {
      return _then(
          _value.copyWith(notificationCustomIntervalSchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReminderModelImplCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$$ReminderModelImplCopyWith(
          _$ReminderModelImpl value, $Res Function(_$ReminderModelImpl) then) =
      __$$ReminderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String notificationTitle,
      String notificationBody,
      List<int> notificationDaysInWeek,
      ReminderNotificationEqualScheduleModel? notificationEqualSchedule,
      ReminderNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule});

  @override
  $ReminderNotificationEqualScheduleModelCopyWith<$Res>?
      get notificationEqualSchedule;
  @override
  $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res>?
      get notificationCustomIntervalSchedule;
}

/// @nodoc
class __$$ReminderModelImplCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res, _$ReminderModelImpl>
    implements _$$ReminderModelImplCopyWith<$Res> {
  __$$ReminderModelImplCopyWithImpl(
      _$ReminderModelImpl _value, $Res Function(_$ReminderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? notificationTitle = null,
    Object? notificationBody = null,
    Object? notificationDaysInWeek = null,
    Object? notificationEqualSchedule = freezed,
    Object? notificationCustomIntervalSchedule = freezed,
  }) {
    return _then(_$ReminderModelImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      notificationBody: null == notificationBody
          ? _value.notificationBody
          : notificationBody // ignore: cast_nullable_to_non_nullable
              as String,
      notificationDaysInWeek: null == notificationDaysInWeek
          ? _value._notificationDaysInWeek
          : notificationDaysInWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      notificationEqualSchedule: freezed == notificationEqualSchedule
          ? _value.notificationEqualSchedule
          : notificationEqualSchedule // ignore: cast_nullable_to_non_nullable
              as ReminderNotificationEqualScheduleModel?,
      notificationCustomIntervalSchedule: freezed ==
              notificationCustomIntervalSchedule
          ? _value.notificationCustomIntervalSchedule
          : notificationCustomIntervalSchedule // ignore: cast_nullable_to_non_nullable
              as ReminderNotificationScheduleCustomIntervalModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderModelImpl extends _ReminderModel {
  const _$ReminderModelImpl(
      {required this.notificationId,
      required this.notificationTitle,
      required this.notificationBody,
      required final List<int> notificationDaysInWeek,
      required this.notificationEqualSchedule,
      required this.notificationCustomIntervalSchedule})
      : _notificationDaysInWeek = notificationDaysInWeek,
        super._();

  factory _$ReminderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderModelImplFromJson(json);

  @override
  final String notificationId;
  @override
  final String notificationTitle;
  @override
  final String notificationBody;
  final List<int> _notificationDaysInWeek;
  @override
  List<int> get notificationDaysInWeek {
    if (_notificationDaysInWeek is EqualUnmodifiableListView)
      return _notificationDaysInWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationDaysInWeek);
  }

  @override
  final ReminderNotificationEqualScheduleModel? notificationEqualSchedule;
  @override
  final ReminderNotificationScheduleCustomIntervalModel?
      notificationCustomIntervalSchedule;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      __$$ReminderModelImplCopyWithImpl<_$ReminderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderModelImplToJson(
      this,
    );
  }
}

abstract class _ReminderModel extends ReminderModel {
  const factory _ReminderModel(
      {required final String notificationId,
      required final String notificationTitle,
      required final String notificationBody,
      required final List<int> notificationDaysInWeek,
      required final ReminderNotificationEqualScheduleModel?
          notificationEqualSchedule,
      required final ReminderNotificationScheduleCustomIntervalModel?
          notificationCustomIntervalSchedule}) = _$ReminderModelImpl;
  const _ReminderModel._() : super._();

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$ReminderModelImpl.fromJson;

  @override
  String get notificationId;
  @override
  String get notificationTitle;
  @override
  String get notificationBody;
  @override
  List<int> get notificationDaysInWeek;
  @override
  ReminderNotificationEqualScheduleModel? get notificationEqualSchedule;
  @override
  ReminderNotificationScheduleCustomIntervalModel?
      get notificationCustomIntervalSchedule;
  @override
  @JsonKey(ignore: true)
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReminderNotificationEqualScheduleModel
    _$ReminderNotificationEqualScheduleModelFromJson(
        Map<String, dynamic> json) {
  return _ReminderNotificationEqualScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderNotificationEqualScheduleModel {
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
  $ReminderNotificationEqualScheduleModelCopyWith<
          ReminderNotificationEqualScheduleModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderNotificationEqualScheduleModelCopyWith<$Res> {
  factory $ReminderNotificationEqualScheduleModelCopyWith(
          ReminderNotificationEqualScheduleModel value,
          $Res Function(ReminderNotificationEqualScheduleModel) then) =
      _$ReminderNotificationEqualScheduleModelCopyWithImpl<$Res,
          ReminderNotificationEqualScheduleModel>;
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
class _$ReminderNotificationEqualScheduleModelCopyWithImpl<$Res,
        $Val extends ReminderNotificationEqualScheduleModel>
    implements $ReminderNotificationEqualScheduleModelCopyWith<$Res> {
  _$ReminderNotificationEqualScheduleModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ReminderNotificationEqualScheduleModelImplCopyWith<$Res>
    implements $ReminderNotificationEqualScheduleModelCopyWith<$Res> {
  factory _$$ReminderNotificationEqualScheduleModelImplCopyWith(
          _$ReminderNotificationEqualScheduleModelImpl value,
          $Res Function(_$ReminderNotificationEqualScheduleModelImpl) then) =
      __$$ReminderNotificationEqualScheduleModelImplCopyWithImpl<$Res>;
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
class __$$ReminderNotificationEqualScheduleModelImplCopyWithImpl<$Res>
    extends _$ReminderNotificationEqualScheduleModelCopyWithImpl<$Res,
        _$ReminderNotificationEqualScheduleModelImpl>
    implements _$$ReminderNotificationEqualScheduleModelImplCopyWith<$Res> {
  __$$ReminderNotificationEqualScheduleModelImplCopyWithImpl(
      _$ReminderNotificationEqualScheduleModelImpl _value,
      $Res Function(_$ReminderNotificationEqualScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationStartTime = freezed,
    Object? notificationEndTime = freezed,
    Object? notificationInterval = freezed,
    Object? notificationSchedules = null,
  }) {
    return _then(_$ReminderNotificationEqualScheduleModelImpl(
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
class _$ReminderNotificationEqualScheduleModelImpl
    extends _ReminderNotificationEqualScheduleModel {
  const _$ReminderNotificationEqualScheduleModelImpl(
      {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      required this.notificationStartTime,
      @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
      required this.notificationEndTime,
      required this.notificationInterval,
      @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      required final List<TimeOfDay> notificationSchedules})
      : _notificationSchedules = notificationSchedules,
        super._();

  factory _$ReminderNotificationEqualScheduleModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReminderNotificationEqualScheduleModelImplFromJson(json);

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
  _$$ReminderNotificationEqualScheduleModelImplCopyWith<
          _$ReminderNotificationEqualScheduleModelImpl>
      get copyWith =>
          __$$ReminderNotificationEqualScheduleModelImplCopyWithImpl<
              _$ReminderNotificationEqualScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderNotificationEqualScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _ReminderNotificationEqualScheduleModel
    extends ReminderNotificationEqualScheduleModel {
  const factory _ReminderNotificationEqualScheduleModel(
          {@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
          required final TimeOfDay? notificationStartTime,
          @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
          required final TimeOfDay? notificationEndTime,
          required final int? notificationInterval,
          @JsonKey(
              fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
          required final List<TimeOfDay> notificationSchedules}) =
      _$ReminderNotificationEqualScheduleModelImpl;
  const _ReminderNotificationEqualScheduleModel._() : super._();

  factory _ReminderNotificationEqualScheduleModel.fromJson(
          Map<String, dynamic> json) =
      _$ReminderNotificationEqualScheduleModelImpl.fromJson;

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
  _$$ReminderNotificationEqualScheduleModelImplCopyWith<
          _$ReminderNotificationEqualScheduleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReminderNotificationScheduleCustomIntervalModel
    _$ReminderNotificationScheduleCustomIntervalModelFromJson(
        Map<String, dynamic> json) {
  return _ReminderNotificationScheduleCustomIntervalModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderNotificationScheduleCustomIntervalModel {
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderNotificationScheduleCustomIntervalModelCopyWith<
          ReminderNotificationScheduleCustomIntervalModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  factory $ReminderNotificationScheduleCustomIntervalModelCopyWith(
          ReminderNotificationScheduleCustomIntervalModel value,
          $Res Function(ReminderNotificationScheduleCustomIntervalModel) then) =
      _$ReminderNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
          ReminderNotificationScheduleCustomIntervalModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class _$ReminderNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
        $Val extends ReminderNotificationScheduleCustomIntervalModel>
    implements $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  _$ReminderNotificationScheduleCustomIntervalModelCopyWithImpl(
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
abstract class _$$ReminderNotificationScheduleCustomIntervalModelImplCopyWith<
        $Res>
    implements $ReminderNotificationScheduleCustomIntervalModelCopyWith<$Res> {
  factory _$$ReminderNotificationScheduleCustomIntervalModelImplCopyWith(
          _$ReminderNotificationScheduleCustomIntervalModelImpl value,
          $Res Function(_$ReminderNotificationScheduleCustomIntervalModelImpl)
              then) =
      __$$ReminderNotificationScheduleCustomIntervalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      List<TimeOfDay> notificationSchedules});
}

/// @nodoc
class __$$ReminderNotificationScheduleCustomIntervalModelImplCopyWithImpl<$Res>
    extends _$ReminderNotificationScheduleCustomIntervalModelCopyWithImpl<$Res,
        _$ReminderNotificationScheduleCustomIntervalModelImpl>
    implements
        _$$ReminderNotificationScheduleCustomIntervalModelImplCopyWith<$Res> {
  __$$ReminderNotificationScheduleCustomIntervalModelImplCopyWithImpl(
      _$ReminderNotificationScheduleCustomIntervalModelImpl _value,
      $Res Function(_$ReminderNotificationScheduleCustomIntervalModelImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationSchedules = null,
  }) {
    return _then(_$ReminderNotificationScheduleCustomIntervalModelImpl(
      notificationSchedules: null == notificationSchedules
          ? _value._notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderNotificationScheduleCustomIntervalModelImpl
    extends _ReminderNotificationScheduleCustomIntervalModel {
  const _$ReminderNotificationScheduleCustomIntervalModelImpl(
      {@JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
      required final List<TimeOfDay> notificationSchedules})
      : _notificationSchedules = notificationSchedules,
        super._();

  factory _$ReminderNotificationScheduleCustomIntervalModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReminderNotificationScheduleCustomIntervalModelImplFromJson(json);

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
  _$$ReminderNotificationScheduleCustomIntervalModelImplCopyWith<
          _$ReminderNotificationScheduleCustomIntervalModelImpl>
      get copyWith =>
          __$$ReminderNotificationScheduleCustomIntervalModelImplCopyWithImpl<
                  _$ReminderNotificationScheduleCustomIntervalModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderNotificationScheduleCustomIntervalModelImplToJson(
      this,
    );
  }
}

abstract class _ReminderNotificationScheduleCustomIntervalModel
    extends ReminderNotificationScheduleCustomIntervalModel {
  const factory _ReminderNotificationScheduleCustomIntervalModel(
          {@JsonKey(
              fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
          required final List<TimeOfDay> notificationSchedules}) =
      _$ReminderNotificationScheduleCustomIntervalModelImpl;
  const _ReminderNotificationScheduleCustomIntervalModel._() : super._();

  factory _ReminderNotificationScheduleCustomIntervalModel.fromJson(
          Map<String, dynamic> json) =
      _$ReminderNotificationScheduleCustomIntervalModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _listTimeOfDayFromJson, toJson: _listTimeOfDayToJson)
  List<TimeOfDay> get notificationSchedules;
  @override
  @JsonKey(ignore: true)
  _$$ReminderNotificationScheduleCustomIntervalModelImplCopyWith<
          _$ReminderNotificationScheduleCustomIntervalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
