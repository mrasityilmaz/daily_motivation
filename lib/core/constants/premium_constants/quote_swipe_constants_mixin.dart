part of 'premium_constants.dart';

mixin _PremiumConstantQuoteSwipeMixin {
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// ##############################################################################
  ///
  /// Quote Swipe Constants
  ///
  final int _kMaxFreeQuoteSwipeCount = 5;
  final int _kMaxPremiumQuoteSwipeCount = -1; // Unlimited

  bool shouldUserWatchAdToUnlockQuoteSwipe({int index = 5}) {
    if (_premiumServices.isPremium) {
      return false;
    } else if (index > 0 && index % _kMaxFreeQuoteSwipeCount == 0) {
      return true;
    } else {
      return false;
    }
  }

  ///
  /// ##############################################################################
  ///
  ///
}
