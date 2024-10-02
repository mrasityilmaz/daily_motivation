part of 'add_new_or_edit_reminder_view.dart';

/// TODO - REFACTOR THIS PAGE

final class _AddNewOrEditReminderViewModel extends BaseViewModel
    with EqualIntervalCalculatorMixin, CustomIntervalCalculatorMixin {
  _AddNewOrEditReminderViewModel({this.editReminderModel});

  final ReminderModel? editReminderModel;

  final ReminderBoxService _reminderBoxService = locator<HiveService>().reminderBoxService;
  late final TextEditingController titleTextController;
  late final TextEditingController messageTextController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  String get title => titleTextController.text;

  String get message => messageTextController.text.trim().isNotEmpty ? messageTextController.text : '';

  void _clearAllFields() {
    titleTextController.clear();
    messageTextController.clear();
    _selectedDaysOfWeekIndex.clear();
    _selectedScheduleType = null;
  }

  void onReady() {
    titleTextController = TextEditingController(
      text: editReminderModel?.notificationTitle,
    );
    messageTextController = TextEditingController(
      text: editReminderModel?.notificationBody,
    );

    if (editReminderModel != null) {
      _initEditReminderValue();
    }
  }

  void _initEditReminderValue() {
    _selectedDaysOfWeekIndex
      ..clear()
      ..addAll(editReminderModel?.notificationDaysInWeek ?? []);

    if (editReminderModel?.notificationCustomIntervalSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.customInterval;
      _customIntervalValue
        ..clear()
        ..addAll(editReminderModel?.notificationCustomIntervalSchedule?.notificationSchedules ?? []);
    } else if (editReminderModel?.notificationEqualSchedule != null) {
      _selectedScheduleType = ReminderScheduleEnum.equalInterval;

      setEqualIntervalEndValue(
        end: editReminderModel?.notificationEqualSchedule?.notificationEndTime,
      );

      setEqualIntervalStartValue(
        start: editReminderModel?.notificationEqualSchedule?.notificationStartTime,
      );

      setEqualIntervalIntervalValue(
        interval: editReminderModel?.notificationEqualSchedule?.notificationInterval ?? 0,
      );
    }
  }

  @override
  void dispose() {
    titleTextController.dispose();
    messageTextController.dispose();
    super.dispose();
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
        if (editReminderModel != null) {
          await _saveEditedReminder();
        } else {
          await _saveNewReminder();
        }
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s);
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
    final ReminderModel reminderModel = ReminderModel(
      notificationId: safeIntId.getId().toString(),
      notificationTitle: title,
      notificationBody: message,
      notificationDaysInWeek: selectedDaysOfWeekIndex,
      notificationEqualSchedule:
          selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
      notificationCustomIntervalSchedule:
          selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    );

    await runBusyFuture(
      _reminderBoxService.addReminder(reminderModel),
    );

    await locator<AppRouter>().maybePop<ReminderModel>(reminderModel);
  }

  Future<void> _saveEditedReminder() async {
    final ReminderModel reminderModel = ReminderModel(
      notificationId: editReminderModel!.notificationId,
      notificationDaysInWeek: selectedDaysOfWeekIndex,
      notificationTitle: title,
      notificationBody: message,
      notificationEqualSchedule:
          selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
      notificationCustomIntervalSchedule:
          selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
    );

    await locator<NotificationService>().scheduleNotifications(reminderModel: reminderModel);

    await runBusyFuture(
      _reminderBoxService.updateReminder(reminderModel.notificationId, reminderModel),
    );

    await locator<AppRouter>().maybePop<ReminderModel>(reminderModel);
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
    if (type != _selectedScheduleType) {
      _selectedScheduleType = type;
    } else {
      _selectedScheduleType = null;
    }
    notifyListeners();
  }
}
