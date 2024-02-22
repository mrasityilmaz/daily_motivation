import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/injection/injection_container.dart';

mixin PremiumConstantQuoteSwipeMixin {
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// ##############################################################################
  ///
  /// Quote Swipe Constants
  ///
  final int _kMaxFreeQuoteSwipeCount = 5;
  final int _kMaxPremiumQuoteSwipeCount = -1; // Unlimited

  ///
  /// if true then user should watch ad to unlock quote swipe
  /// if false then user should not watch ad to unlock quote swipe

  bool shouldUserWatchAdToUnlockQuoteSwipe({int index = 5}) {
    if (_premiumServices.isPremium) {
      if (index % _kMaxPremiumQuoteSwipeCount == 0) {
        return true;
      } else {
        return false;
      }
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
