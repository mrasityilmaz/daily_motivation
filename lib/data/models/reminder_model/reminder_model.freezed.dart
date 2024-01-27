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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  String get notificationId => throw _privateConstructorUsedError;
  String get notificationTitle => throw _privateConstructorUsedError;
  String get notificationBody => throw _privateConstructorUsedError;
  List<int> get notificationDaysInWeek => throw _privateConstructorUsedError;
  List<DateTime> get notificationSchedules =>
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
      List<DateTime> notificationSchedules});
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
    Object? notificationSchedules = null,
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
      notificationSchedules: null == notificationSchedules
          ? _value.notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
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
      List<DateTime> notificationSchedules});
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
    Object? notificationSchedules = null,
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
      notificationSchedules: null == notificationSchedules
          ? _value._notificationSchedules
          : notificationSchedules // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
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
      required final List<DateTime> notificationSchedules})
      : _notificationDaysInWeek = notificationDaysInWeek,
        _notificationSchedules = notificationSchedules,
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

  final List<DateTime> _notificationSchedules;
  @override
  List<DateTime> get notificationSchedules {
    if (_notificationSchedules is EqualUnmodifiableListView)
      return _notificationSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationSchedules);
  }

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
          required final List<DateTime> notificationSchedules}) =
      _$ReminderModelImpl;
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
  List<DateTime> get notificationSchedules;
  @override
  @JsonKey(ignore: true)
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
