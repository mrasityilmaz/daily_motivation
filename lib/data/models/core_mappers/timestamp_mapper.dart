import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';

@immutable
final class TimestampMapper extends SimpleMapper<Timestamp> {
  const TimestampMapper();

  @override
  Timestamp decode(Object value) {
    if (value is int) {
      return Timestamp.fromMillisecondsSinceEpoch(value);
    }
    return Timestamp.now();
  }

  @override
  int? encode(Timestamp self) {
    return self.millisecondsSinceEpoch;
  }
}

@immutable
final class DatetimeMapper extends SimpleMapper<DateTime> {
  const DatetimeMapper();

  @override
  DateTime decode(Object value) {
    try {
      return DateTime.tryParse(value.toString()) ?? DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }

  @override
  Object? encode(DateTime self) {
    return self.toIso8601String();
  }
}
