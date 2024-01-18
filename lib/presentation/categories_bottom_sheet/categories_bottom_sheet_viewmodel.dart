part of 'categories_bottom_sheet.dart';

final class _CategoriesBottomSheetViewModel extends ReactiveViewModel {
  final QuoteAndCategoryService _categoryService = locator<QuoteAndCategoryService>();
  QuoteAndCategoryService get listenableCategoryService => listenableServices.first as QuoteAndCategoryService;

  Categories get selectedCategory => listenableCategoryService.selectedCategory;

  Future<void> changeCategory({required Categories category, String locale = 'tr'}) async {
    try {
      await runBusyFuture(
        Future.delayed(const Duration(milliseconds: 200), () async {
          await _categoryService.changeCategory(category: category, locale: locale);
        }),
      );
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_categoryService];
}
