part of 'reminders_view.dart';

final class _RemindersViewModel extends BaseViewModel {
  final ReminderBoxService _reminderBoxService = HiveService.instance.reminderBoxService;

  List<ReminderModel> get reminders => _reminderBoxService.reminderList;
}
