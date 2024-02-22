mixin PremiumConstantThemeConfigMixin {
  ///
  /// ##############################################################################
  ///
  /// Reminder Constants
  ///
  final int _kMaxFreeThemeBgCount = 9;

  final int _kMaxPremiumThemeBgCount = 99999; // Unlimited

  ///
  /// ##############################################################################
  ///
  ///

  bool shouldUserWatchAdToUnlockTheme({int index = 0, bool userIsPremium = false}) => userIsPremium ? (index >= _kMaxPremiumThemeBgCount) : (index >= _kMaxFreeThemeBgCount);
}
