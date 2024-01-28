part of '../add_new_or_edit_reminder_view.dart';

mixin EqualIntervalCalculatorMixin on BaseViewModel {
  final List<(int index, GlobalKey itemKey)> _equalIntervalKeyList = List<(int index, GlobalKey itemKey)>.generate(24, (index) => (index, GlobalKey()));

  List<(int index, GlobalKey itemKey)> get equalIntervalKeyList => _equalIntervalKeyList;

  ({TimeOfDay start, TimeOfDay end, int? interval}) _equalIntervalValue = (start: const TimeOfDay(hour: 9, minute: 0), end: const TimeOfDay(hour: 22, minute: 0), interval: null);

  ({TimeOfDay start, TimeOfDay end, int? interval}) get equalIntervalValue => _equalIntervalValue;

  ///
  /// Set Start time of the equal interval
  ///
  void setEqualIntervalStartValue({TimeOfDay? start}) {
    _equalIntervalValue = (start: start ?? _equalIntervalValue.start, end: _equalIntervalValue.end, interval: _equalIntervalValue.interval);
    notifyListeners();
  }

  ///
  /// Set End time of the equal interval
  ///
  void setEqualIntervalEndValue({TimeOfDay? end}) {
    if (end != null && _equalIntervalValue.start.hour > end.hour) {
      _equalIntervalValue = (start: end, end: _equalIntervalValue.start, interval: _equalIntervalValue.interval);
    } else {
      _equalIntervalValue = (start: _equalIntervalValue.start, end: end ?? _equalIntervalValue.end, interval: _equalIntervalValue.interval);
    }
    notifyListeners();
  }

  ///
  /// Set Interval of the equal interval
  ///
  void setEqualIntervalIntervalValue({required int interval}) {
    _equalIntervalValue = (start: _equalIntervalValue.start, end: _equalIntervalValue.end, interval: interval);
    notifyListeners();
  }

  ///
  /// Calculate the equal interval schedules
  ///
  ///

  List<TimeOfDay> get equalIntervalScheduleList => _calculateEqualIntervalSchedules();

  ReminderNotificationEqualScheduleModel get equalIntervalScheduleModel => ReminderNotificationEqualScheduleModel(
        notificationStartTime: _equalIntervalValue.start,
        notificationEndTime: _equalIntervalValue.end,
        notificationInterval: _equalIntervalValue.interval,
        notificationSchedules: _calculateEqualIntervalSchedules(),
      );

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
          ///
          /// New hour and minute calculation
          ///
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
    LoggerService.instance.printLog('Schedules: $schedules');
    return schedules;
  }

  int _calculateDifference(TimeOfDay time1, TimeOfDay time2) {
    final int hourDifference = (time2.hour - time1.hour).abs();
    final int minuteDifference = (time2.minute - time1.minute).abs();
    return hourDifference * 60 + minuteDifference;
  }
}
