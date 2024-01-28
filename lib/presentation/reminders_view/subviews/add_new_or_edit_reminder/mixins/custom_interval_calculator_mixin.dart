part of '../add_new_or_edit_reminder_view.dart';

mixin CustomIntervalCalculatorMixin on BaseViewModel {
  final List<TimeOfDay> _customIntervalValue = List<TimeOfDay>.empty(growable: true);

  List<TimeOfDay> get customIntervalValue => _customIntervalValue..sort((a, b) => a.hour.compareTo(b.hour) == 0 ? a.minute.compareTo(b.minute) : a.hour.compareTo(b.hour));

  ReminderNotificationScheduleCustomIntervalModel get customIntervalScheduleModel => ReminderNotificationScheduleCustomIntervalModel(
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
}
