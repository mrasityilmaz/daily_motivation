part of 'reminders_view.dart';

final class _RemindersViewModel extends ReactiveViewModel with PremiumConstantReminderMixin {
  final PremiumServices _premiumServices = locator<PremiumServices>();
  final ReminderBoxService _reminderBoxService = locator<HiveService>().reminderBoxService;

  PremiumServices get _listenablePremiumServices => listenableServices.first as PremiumServices;
  bool get userIsPremium => _listenablePremiumServices.isPremium;

  final List<ReminderModel> _myReminderListStatic = List<ReminderModel>.empty(growable: true);
  List<ReminderModel> get _myReminderListBasedHive => _reminderBoxService.reminderList;
  List<ReminderModel> get reminderList => [..._myReminderListBasedHive, ..._myReminderListStatic]..toSet();

  bool get hasReachedMaxReminderCount => hasReachLimit(total: reminderList.length);

  Future<void> onTapAddNewReminder() async {
    final bool showAd = shouldUserWatchAdToAddNewReminder(total: reminderList.length, userIsPremium: userIsPremium);

    if (showAd) {
      /// TODO: Show ad
      debugPrint('Show ad');
    }

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

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _premiumServices,
      ];
}
