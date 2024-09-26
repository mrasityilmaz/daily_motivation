part of '../quote_notification_view.dart';

mixin CustomIntervalCalculatorMixin on BaseViewModel {
  final List<ScheduleTime> _customIntervalValue = List<ScheduleTime>.empty(growable: true);

  List<ScheduleTime> get customIntervalValue => _customIntervalValue
    ..sort((a, b) => a.hour.compareTo(b.hour) == 0 ? a.minute.compareTo(b.minute) : a.hour.compareTo(b.hour));

  QuoteNotificationScheduleCustomIntervalModel get customIntervalScheduleModel =>
      QuoteNotificationScheduleCustomIntervalModel(
        notificationSchedules: _customIntervalValue,
      );

  void addCustomIntervalTimeValue({required TimeOfDay time}) {
    _customIntervalValue.add(time);
    notifyListeners();
  }

  void removeCustomIntervalTimeValue({required int index}) {
    _customIntervalValue.removeAt(index);

    notifyListeners();
  }

  void setCustomIntervalTimeValue({required int index, required TimeOfDay time}) {
    _customIntervalValue[index] = time;
    notifyListeners();
  }

  bool get isCustomIntervalTimeValueValid {
    return _customIntervalValue.isNotEmpty;
  }
}
