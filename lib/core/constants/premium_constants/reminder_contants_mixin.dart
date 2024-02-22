mixin PremiumConstantReminderMixin {
  ///
  /// ##############################################################################
  ///
  /// Reminder Constants
  ///
  final int _kMaxFreeReminderCount = 1;

  final int _kMaxPremiumReminderCount = 10;

  ///
  /// ##############################################################################
  ///
  ///

  bool hasReachLimit({int total = 0}) {
    if (total >= _kMaxPremiumReminderCount) {
      return true;
    }
    return false;
  }

  bool shouldUserWatchAdToAddNewReminder({int total = 0, bool userIsPremium = false}) {
    if (userIsPremium) {
      return false;
    } else if (!userIsPremium && total > _kMaxFreeReminderCount) {
      return true;
    } else {
      return false;
    }
  }
}
