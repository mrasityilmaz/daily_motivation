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

  List<({int index, TimeOfDay? time})> _customIntervalValue = List<({int index, TimeOfDay? time})>.empty(growable: true);

  List<({int index, TimeOfDay? time})> get customIntervalValue => _customIntervalValue.where((element) => element.time != null).toList()..sort((a, b) => a.index.compareTo(b.index));

  void addCustomIntervalTimeValue({required int index, TimeOfDay? time}) {
    _customIntervalValue.add((index: index, time: time));
    notifyListeners();
  }

  void onReorderCustomInterval({required int oldIndex, required int newIndex}) {
    if (newIndex > _customIntervalValue.length) {
      newIndex = _customIntervalValue.length;
    }
    if (oldIndex < newIndex) {
      newIndex--;
    }

    final oldValue = _customIntervalValue[oldIndex];

    _customIntervalValue
      ..removeAt(oldIndex)
      ..insert(newIndex, (index: newIndex, time: oldValue.time));

    notifyListeners();
  }

  void removeCustomIntervalTimeValue({required int index}) {
    _customIntervalValue.removeWhere((element) => element.index == index);

    _customIntervalValue = _customIntervalValue.map((e) {
      if (e.index > index) {
        return (index: e.index - 1, time: e.time);
      }
      return e;
    }).toList();
    notifyListeners();
  }

  void setCustomIntervalTimeValue({required int index, TimeOfDay? time}) {
    _customIntervalValue[index] = (index: index, time: time);
    notifyListeners();
  }
}
