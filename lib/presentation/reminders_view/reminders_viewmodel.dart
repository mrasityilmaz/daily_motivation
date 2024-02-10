part of 'reminders_view.dart';

final class _RemindersViewModel extends BaseViewModel {
  final ReminderBoxService _reminderBoxService = HiveService.instance.reminderBoxService;

  final List<ReminderModel> _myReminderListStatic = List<ReminderModel>.empty(growable: true);
  List<ReminderModel> get _myReminderListBasedHive => _reminderBoxService.reminderList;
  List<ReminderModel> get reminderList => [..._myReminderListBasedHive, ..._myReminderListStatic]..toSet();

  Future<void> onTapAddNewReminder() async {
    final ReminderModel? result = await locator<AppRouter>().push(AddNewOrEditReminderViewRoute());

    if (result != null) {
      _addOrUpdateTemporarilyAddedReminder(result);
    }
  }

  Future<void> onTapEditReminder(ReminderModel reminder) async {
    final ReminderModel? result = await locator<AppRouter>().push(AddNewOrEditReminderViewRoute(reminder: reminder));

    if (result != null) {
      _addOrUpdateTemporarilyAddedReminder(result);
    }
  }

  void _addOrUpdateTemporarilyAddedReminder(ReminderModel reminderModel) {
    if (_myReminderListBasedHive.any((element) => element.notificationId != reminderModel.notificationId) &&
        _myReminderListStatic.any((element) => element.notificationId != reminderModel.notificationId)) {
      _myReminderListStatic.add(reminderModel);
    }
    notifyListeners();
  }

  Future<void> onPressedDeleteReminderButton(String reminderId) async {
    await _reminderBoxService.deleteReminder(reminderId);
    notifyListeners();
  }
}
