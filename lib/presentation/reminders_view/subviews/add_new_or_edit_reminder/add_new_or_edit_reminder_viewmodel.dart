part of 'add_new_or_edit_reminder_view.dart';

final class _AddNewOrEditReminderViewModel extends BaseViewModel with EqualIntervalCalculatorMixin, CustomIntervalCalculatorMixin {
  _AddNewOrEditReminderViewModel();

  final HiveService _hiveService = HiveService.instance;
  late final TextEditingController quoteTextController;
  late final TextEditingController authorTextController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState?.validate() ?? false;

  String get quote => quoteTextController.text;

  String get author => authorTextController.text.trim().isNotEmpty ? authorTextController.text : '';

  int _selectedScheduleIndex = -1;

  int get selectedScheduleIndex => _selectedScheduleIndex;

  void setSelectedScheduleIndex(int index) {
    _selectedScheduleIndex = index;
    notifyListeners();
  }

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

  void _clearTextFields() {
    quoteTextController.clear();
    authorTextController.clear();
  }

  void onReady() {
    quoteTextController = TextEditingController();
    authorTextController = TextEditingController();
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    authorTextController.dispose();
    super.dispose();
  }
}
