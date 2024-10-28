part of 'reminders_view.dart';

final class _RemindersViewModel extends ReactiveViewModel with PremiumConstantReminderMixin {
  final PremiumServices _premiumServices = locator<PremiumServices>();
  final ReminderBoxService _reminderBoxService = locator<HiveService>().reminderBoxService;

  final List<ReminderModel> _myReminderListStatic = List<ReminderModel>.empty(growable: true);
  List<ReminderModel> get _myReminderListBasedHive => _reminderBoxService.reminderList;
  List<ReminderModel> get reminderList => [..._myReminderListBasedHive, ..._myReminderListStatic]..toSet();

  bool get hasReachedMaxReminderCount => hasReachLimit(total: reminderList.length);
  bool get userIsPremium => _premiumServices.isPremium;

  Future<void> onTapAddNewReminder() async {
    try {
      final bool showAd = shouldUserWatchAdToAddNewReminder(total: reminderList.length, userIsPremium: userIsPremium);

      if (showAd) {
        /// TODO: Show ad
        debugPrint('Show ad');
      }

      final ReminderModel? result = await locator<AppRouter>().push(AddNewOrEditReminderViewRoute());

      if (result != null) {
        _addOrUpdateTemporarilyAddedReminder(result);
      }
    } catch (e, s) {
      _printCatchError(e, s, context: 'onTapAddNewReminder');
    }
  }

  Future<void> onTapEditReminder(ReminderModel reminder) async {
    try {
      final ReminderModel? result = await locator<AppRouter>().push(AddNewOrEditReminderViewRoute(reminder: reminder));

      if (result != null) {
        _addOrUpdateTemporarilyAddedReminder(result);
      }
    } catch (e, s) {
      _printCatchError(e, s, context: 'onTapEditReminder');
    }
  }

  void _addOrUpdateTemporarilyAddedReminder(ReminderModel reminderModel) {
    try {
      if (_myReminderListBasedHive.any((element) => element.notificationId != reminderModel.notificationId) &&
          _myReminderListStatic.any((element) => element.notificationId != reminderModel.notificationId)) {
        _myReminderListStatic.add(reminderModel);
      }
      notifyListeners();
    } catch (e, s) {
      _printCatchError(e, s, context: '_addOrUpdateTemporarilyAddedReminder');
    }
  }

  Future<void> onPressedDeleteReminderButton(String reminderId) async {
    try {
      await _reminderBoxService.deleteReminder(reminderId);
      notifyListeners();
    } catch (e, s) {
      _printCatchError(e, s, context: 'onPressedDeleteReminderButton');
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _premiumServices,
      ];

  void _printCatchError(Object e, StackTrace s, {String? context}) {
    LoggerService.catchLog(
      e,
      s,
      'RemindersViewModel.$context',
    );
  }
}
