import 'package:daily_motivation/core/constants/categories_enum.dart';

extension CategoriesExtension on List<Categories> {
  List<Categories> get premiumCategories {
    return where((element) => element.isPremium).toList();
  }

  List<Categories> get freeCategories {
    /// TODO  when PremiumServices is implemented, change this to return only the free categories
    ///
    return where((element) => !element.isPremium).toList();
  }

  List<Categories> get sortAlphabetically {
    return this
      ..sort((a, b) => a.name.compareTo(b.name))
      ..toList();
  }
}
