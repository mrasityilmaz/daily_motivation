part of 'quote_notification_view.dart';

final class _QuoteNotificationViewModel extends BaseViewModel with EqualIntervalCalculatorMixin, CustomIntervalCalculatorMixin {
  _QuoteNotificationViewModel({this.editQuoteNotification});

  final QuoteNotificationModel? editQuoteNotification;

  final ReminderBoxService _reminderBoxService = HiveService.instance.reminderBoxService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  void onReady() {
    if (editQuoteNotification != null) {
      _initEditReminderValue();
    }
  }

  void _initEditReminderValue() {
    _selectedDaysOfWeekIndex
      ..clear()
      ..addAll(editQuoteNotification?.notificationDaysInWeek ?? []);

    if (editQuoteNotification?.notificationCustomIntervalSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.customInterval;
      _customIntervalValue
        ..clear()
        ..addAll(editQuoteNotification?.notificationCustomIntervalSchedule?.notificationSchedules ?? []);
    } else if (editQuoteNotification?.notificationEqualSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.equalInterval;

      setEqualIntervalEndValue(
        end: editQuoteNotification?.notificationEqualSchedule?.notificationEndTime,
      );

      setEqualIntervalStartValue(
        start: editQuoteNotification?.notificationEqualSchedule?.notificationStartTime,
      );

      setEqualIntervalIntervalValue(
        interval: editQuoteNotification?.notificationEqualSchedule?.notificationInterval ?? 0,
      );
    }
  }

  bool get formIsValid {
    return isFormValid &&
        ((isCustomIntervalTimeValueValid && _selectedScheduleType == ReminderScheduleEnum.customInterval) ||
            (isEqualIntervalTimeValueValid && selectedScheduleType == ReminderScheduleEnum.equalInterval)) &&
        selectedDaysOfWeekIndex.isNotEmpty;
  }

  Future<void> save() async {
    try {
      if (formIsValid) {
        if (editQuoteNotification != null) {
          await _saveEditedReminder();
        } else {
          await _saveNewReminder();
        }
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  /// Saves a new reminder.
  ///
  /// This method is responsible for saving a new reminder. It is an asynchronous method that returns a [Future] with no return value ([void]).
  /// Use this method to save a new reminder in the application.
  /// Example usage:
  /// ```dart
  /// await _saveNewReminder();
  /// ```
  Future<void> _saveNewReminder() async {
    // final ReminderModel reminderModel = ReminderModel(
    //   notificationId: const Uuid().v4(),

    //   notificationDaysInWeek: selectedDaysOfWeekIndex,
    //   notificationEqualSchedule: selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
    //   notificationCustomIntervalSchedule: selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    // );

    // await runBusyFuture(
    //   _reminderBoxService.addReminder(reminderModel),
    // );

    // await locator<AppRouter>().pop<ReminderModel>(reminderModel);
  }

  Future<void> _saveEditedReminder() async {
    // final ReminderModel reminderModel = ReminderModel(
    //   notificationId: editQuoteNotification!.notificationId,
    //   notificationDaysInWeek: selectedDaysOfWeekIndex,
    //   notificationTitle: title,
    //   notificationBody: message,
    //   notificationEqualSchedule: selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
    //   notificationCustomIntervalSchedule: selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    // );

    // await runBusyFuture(
    //   _reminderBoxService.updateReminder(reminderModel.notificationId, reminderModel),
    // );

    // await locator<AppRouter>().pop<ReminderModel>(reminderModel);
  }

  ///
  /// Selected days of week
  ///
  ///

  final List<int> _selectedDaysOfWeekIndex = List<int>.empty(growable: true);

  List<int> get selectedDaysOfWeekIndex => _selectedDaysOfWeekIndex;

  bool isDaysOfWeekSelected(int index) => _selectedDaysOfWeekIndex.any((element) => element == index);

  void addOrRemoveSelectedDaysOfWeekIndex(int index) {
    if (_selectedDaysOfWeekIndex.contains(index)) {
      _selectedDaysOfWeekIndex.remove(index);
    } else {
      _selectedDaysOfWeekIndex.add(index);
    }
    notifyListeners();
  }

  ///
  /// Selected schedule type
  /// Equal interval or custom interval
  ///
  ///

  ReminderScheduleEnum? _selectedScheduleType;

  ReminderScheduleEnum? get selectedScheduleType => _selectedScheduleType;

  void setSelectedScheduleType(ReminderScheduleEnum type) {
    _selectedScheduleType = type;
    notifyListeners();
  }
}
