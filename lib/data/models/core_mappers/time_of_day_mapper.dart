import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

@immutable
final class TimeOfDayMapper extends SimpleMapper<TimeOfDay> {
  const TimeOfDayMapper();

  @override
  TimeOfDay decode(Object value) {
    if (value is String) {
      final parts = value.split(':');
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }

  @override
  String? encode(TimeOfDay self) {
    return '${self.hour}:${self.minute}';
  }
}
