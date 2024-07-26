part of 'quote_notification_view.dart';

final class _QuoteNotificationViewModel extends BaseViewModel with EqualIntervalCalculatorMixin, CustomIntervalCalculatorMixin, SelectedCategoriesMixin {
  _QuoteNotificationViewModel();

  final QuoteNotificationBoxService _quoteNotificationBoxService = locator<HiveService>().quoteNotificationBoxService;

  late final QuoteNotificationModel? _oldQuoteNotificationModel = _quoteNotificationBoxService.quoteNotificationValue;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  void onReady() {
    if (_oldQuoteNotificationModel != null) {
      _initEditReminderValue();
    }
  }

  void _initEditReminderValue() {
    _selectedDaysOfWeekIndex
      ..clear()
      ..addAll(_oldQuoteNotificationModel?.notificationDaysInWeek ?? []);

    _selectedCategories
      ..clear()
      ..addAll(_oldQuoteNotificationModel?.notificationCategories ?? []);

    if (_oldQuoteNotificationModel?.notificationCustomIntervalSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.customInterval;
      _customIntervalValue
        ..clear()
        ..addAll(_oldQuoteNotificationModel?.notificationCustomIntervalSchedule?.notificationSchedules ?? []);
    } else if (_oldQuoteNotificationModel?.notificationEqualSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.equalInterval;

      setEqualIntervalEndValue(
        end: _oldQuoteNotificationModel?.notificationEqualSchedule?.notificationEndTime,
      );

      setEqualIntervalStartValue(
        start: _oldQuoteNotificationModel?.notificationEqualSchedule?.notificationStartTime,
      );

      setEqualIntervalIntervalValue(
        interval: _oldQuoteNotificationModel?.notificationEqualSchedule?.notificationInterval ?? 0,
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
        if (_oldQuoteNotificationModel != null) {
          await _saveEditedQuotedNotification();
        } else {
          await _saveNewQuoteNotification();
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
  Future<void> _saveNewQuoteNotification() async {
    final QuoteNotificationModel quoteNotificationModel = QuoteNotificationModel(
      notificationId: const Uuid().v4(),
      notificationCategories: selectedCategoriesValue,
      notificationDaysInWeek: selectedDaysOfWeekIndex,
      notificationEqualSchedule: selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
      notificationCustomIntervalSchedule: selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    );

    await runBusyFuture(
      _quoteNotificationBoxService.addQuoteNotification(quoteNotificationModel),
    );

    await locator<AppRouter>().pop();
  }

  Future<void> _saveEditedQuotedNotification() async {
    final QuoteNotificationModel quoteNotificationModel = QuoteNotificationModel(
      notificationId: _oldQuoteNotificationModel!.notificationId,
      notificationCategories: selectedCategoriesValue,
      notificationDaysInWeek: selectedDaysOfWeekIndex,
      notificationEqualSchedule: selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
      notificationCustomIntervalSchedule: selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    );

    await runBusyFuture(
      _quoteNotificationBoxService.updateQuoteNotification(quoteNotificationModel.notificationId, quoteNotificationModel),
    );

    await locator<AppRouter>().pop();
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
