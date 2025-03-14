import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/injection/injection_container.dart';

mixin PremiumConstantCategoryMixin {
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
