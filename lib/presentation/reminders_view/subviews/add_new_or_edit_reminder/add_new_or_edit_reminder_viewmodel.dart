part of 'add_new_or_edit_reminder_view.dart';

final class _AddNewOrEditReminderViewModel extends BaseViewModel {
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

  ({TimeOfDay? start, TimeOfDay? end, int? interval}) _equalIntervalValue = (start: null, end: null, interval: null);

  ({TimeOfDay? start, TimeOfDay? end, int? interval}) get equalIntervalValue => _equalIntervalValue;

  void setEqualIntervalStartValue({TimeOfDay? start}) {
    _equalIntervalValue = (start: start, end: _equalIntervalValue.end, interval: _equalIntervalValue.interval);
    notifyListeners();
  }

  void setEqualIntervalEndValue({TimeOfDay? end}) {
    _equalIntervalValue = (start: _equalIntervalValue.start, end: end, interval: _equalIntervalValue.interval);
    notifyListeners();
  }

  void setEqualIntervalIntervalValue({required int interval}) {
    _equalIntervalValue = (start: _equalIntervalValue.start, end: _equalIntervalValue.end, interval: interval);
    notifyListeners();
  }

  final List<TimeOfDay> _customIntervalValue = List<TimeOfDay>.empty(growable: true);

  List<TimeOfDay> get customIntervalValue => _customIntervalValue..sort((a, b) => a.hour.compareTo(b.hour) == 0 ? a.minute.compareTo(b.minute) : a.hour.compareTo(b.hour));

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
