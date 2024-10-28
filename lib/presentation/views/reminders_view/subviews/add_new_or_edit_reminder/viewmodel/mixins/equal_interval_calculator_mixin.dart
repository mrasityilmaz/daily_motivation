part of '../add_new_or_edit_reminder_viewmodel.dart';

mixin EqualIntervalCalculatorMixin on BaseViewModel {
  final List<(int index, GlobalKey itemKey)> _equalIntervalKeyList =
      List<(int index, GlobalKey itemKey)>.generate(24, (index) => (index, GlobalKey()));

  List<(int index, GlobalKey itemKey)> get equalIntervalKeyList => _equalIntervalKeyList;

  ({TimeOfDay start, TimeOfDay end, int? interval}) _equalIntervalValue =
      (start: const TimeOfDay(hour: 9, minute: 0), end: const TimeOfDay(hour: 22, minute: 0), interval: null);

  ({TimeOfDay start, TimeOfDay end, int? interval}) get equalIntervalValue => _equalIntervalValue;

  ///
  /// Set Start time of the equal interval
  ///
  void setEqualIntervalStartValue({TimeOfDay? start}) {
    _equalIntervalValue = (
      start: start ?? _equalIntervalValue.start,
      end: _equalIntervalValue.end,
      interval: _equalIntervalValue.interval
    );
    notifyListeners();
  }

  ///
  /// Set End time of the equal interval
  ///
  void setEqualIntervalEndValue({TimeOfDay? end}) {
    if (end != null && _equalIntervalValue.start.hour > end.hour) {
      _equalIntervalValue = (start: end, end: _equalIntervalValue.start, interval: _equalIntervalValue.interval);
    } else {
      _equalIntervalValue = (
        start: _equalIntervalValue.start,
        end: end ?? _equalIntervalValue.end,
        interval: _equalIntervalValue.interval
      );
    }
    notifyListeners();
  }

  ///
  /// Set Interval of the equal interval
  ///
  void setEqualIntervalIntervalValue({required int interval, BuildContext? context}) {
    _equalIntervalValue = (start: _equalIntervalValue.start, end: _equalIntervalValue.end, interval: interval);

    if (context != null) {
      try {
        Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 300));
        // ignore: empty_catches
      } catch (e) {}
    }
    notifyListeners();
  }

  ///
  /// Calculate the equal interval schedules
  ///
  ///

  List<TimeOfDay> get equalIntervalScheduleList => _calculateEqualIntervalSchedules();

  bool get isEqualIntervalTimeValueValid {
    return _equalIntervalValue.interval != null;
  }

  ReminderNotificationEqualScheduleModel get equalIntervalScheduleModel => ReminderNotificationEqualScheduleModel(
        notificationStartTime: _equalIntervalValue.start,
        notificationEndTime: _equalIntervalValue.end,
        notificationInterval: _equalIntervalValue.interval,
        notificationSchedules: _calculateEqualIntervalSchedules(),
      );

  /// Calculates equal interval schedules based on the start time, end time, and interval value.
  /// Returns a list of [TimeOfDay] objects representing the calculated schedules.
  List<TimeOfDay> _calculateEqualIntervalSchedules() {
    final List<TimeOfDay> schedules = List<TimeOfDay>.empty(growable: true);

    if (_equalIntervalValue.interval != null) {
      final TimeOfDay startTime = _equalIntervalValue.start;
      final TimeOfDay endTime = _equalIntervalValue.end;

      final int intervalMinute = _calculateDifference(startTime, endTime) ~/ _equalIntervalValue.interval!;
      final int interval = _equalIntervalValue.interval!;

      for (var i = 0; i < interval; i++) {
        if (i == 0) {
          schedules.add(startTime);
        } else {
          final int hour = startTime.hour + (intervalMinute * i) ~/ 60;
          final int minute = startTime.minute + (intervalMinute * i) % 60;
          final TimeOfDay calculatedTimeOfDay = TimeOfDay(hour: hour, minute: minute);

          if (calculatedTimeOfDay.hour < endTime.hour) {
            schedules.add(calculatedTimeOfDay);
          } else if (calculatedTimeOfDay.hour == endTime.hour && (calculatedTimeOfDay.minute <= endTime.minute)) {
            schedules.add(calculatedTimeOfDay);
          } else {
            continue;
          }
        }
      }
    }
    LoggerService.printLog('Schedules: $schedules');
    return schedules;
  }

  /// Calculates the difference in minutes between two [TimeOfDay] values.
  ///
  /// The difference is calculated by subtracting the hour and minute values of [time1]
  /// from the hour and minute values of [time2], taking the absolute value of each difference,
  /// and then returning the total difference in minutes.
  ///
  /// Returns the difference in minutes between [time1] and [time2].
  int _calculateDifference(TimeOfDay time1, TimeOfDay time2) {
    final int hourDifference = (time2.hour - time1.hour).abs();
    final int minuteDifference = (time2.minute - time1.minute).abs();
    return hourDifference * 60 + minuteDifference;
  }
}
