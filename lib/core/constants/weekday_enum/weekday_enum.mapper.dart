// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'weekday_enum.dart';

class WeekdayEnumMapper extends EnumMapper<WeekdayEnum> {
  WeekdayEnumMapper._();

  static WeekdayEnumMapper? _instance;
  static WeekdayEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeekdayEnumMapper._());
    }
    return _instance!;
  }

  static WeekdayEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WeekdayEnum decode(dynamic value) {
    switch (value) {
      case 0:
        return WeekdayEnum.monday;
      case 1:
        return WeekdayEnum.tuesday;
      case 2:
        return WeekdayEnum.wednesday;
      case 3:
        return WeekdayEnum.thursday;
      case 4:
        return WeekdayEnum.friday;
      case 5:
        return WeekdayEnum.saturday;
      case 6:
        return WeekdayEnum.sunday;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WeekdayEnum self) {
    switch (self) {
      case WeekdayEnum.monday:
        return 0;
      case WeekdayEnum.tuesday:
        return 1;
      case WeekdayEnum.wednesday:
        return 2;
      case WeekdayEnum.thursday:
        return 3;
      case WeekdayEnum.friday:
        return 4;
      case WeekdayEnum.saturday:
        return 5;
      case WeekdayEnum.sunday:
        return 6;
    }
  }
}

extension WeekdayEnumMapperExtension on WeekdayEnum {
  dynamic toValue() {
    WeekdayEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WeekdayEnum>(this);
  }
}
