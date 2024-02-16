part of 'premium_constants.dart';

mixin _PremiumConstantCategoryMixin {
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// ##############################################################################
  ///
  /// Category Constants
  ///
  final int kMaxFreeCategoryCount = 1;
  final int kMaxPremiumCategoryCount = 10;

  ///
  /// ##############################################################################
  ///
  ///

  @protected
  int get _maxCategoryCount => _premiumServices.isPremium ? kMaxPremiumCategoryCount : kMaxFreeCategoryCount;

  ///
  /// This method checks if the category limit is reached
  /// Example :  User when choosing a category
  ///
  ///
  bool isCategoryLimitReached(int categoryCount) {
    return categoryCount >= _maxCategoryCount;
  }

  bool isThisCategoryRequiredWatchAd(Categories category) {
    if (category.isPremium && !_premiumServices.isPremium) {
      return false;
    }
    return !_premiumServices.isPremium;
  }
}
