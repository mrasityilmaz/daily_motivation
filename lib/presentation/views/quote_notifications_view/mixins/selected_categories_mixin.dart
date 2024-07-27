part of '../quote_notification_view.dart';

mixin SelectedCategoriesMixin on BaseViewModel {
  final List<Categories> _selectedCategories = List<Categories>.empty(growable: true);

  List<Categories> get selectedCategoriesValue => _selectedCategories;

  void addOrRemoveCategory({required Categories category}) {
    if (_selectedCategories.length < 3) {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
      notifyListeners();
    } else {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      }
      notifyListeners();
    }
  }

  bool isCategorySelected(Categories category) {
    return _selectedCategories.contains(category);
  }
}
