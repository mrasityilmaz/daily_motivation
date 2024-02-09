part of 'add_new_or_edit_reminder_view.dart';

final class _AddNewOrEditReminderViewModel extends BaseViewModel with EqualIntervalCalculatorMixin, CustomIntervalCalculatorMixin {
  _AddNewOrEditReminderViewModel();

  final ReminderBoxService _reminderBoxService = HiveService.instance.reminderBoxService;
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
    titleTextController = TextEditingController();
    messageTextController = TextEditingController();
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
        final ReminderModel reminderModel = ReminderModel(
          notificationId: const Uuid().v4(),
          notificationTitle: title,
          notificationBody: message,
          notificationDaysInWeek: selectedDaysOfWeekIndex,
          notificationEqualSchedule: selectedScheduleType == ReminderScheduleEnum.equalInterval ? equalIntervalScheduleModel : null,
          notificationCustomIntervalSchedule: selectedScheduleType == ReminderScheduleEnum.customInterval ? customIntervalScheduleModel : null,
        );
        await runBusyFuture(
          _reminderBoxService.addReminder(reminderModel),
        );

        _clearAllFields();

        await locator<AppRouter>().pop<ReminderModel>(reminderModel);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
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
