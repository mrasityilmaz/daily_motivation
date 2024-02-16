// ignore_for_file: comment_references

import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/core/constants/premium_constants/premium_constants.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/models/quote_model/quote_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/category_service/quote_and_category_service.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

final class HomeViewModel extends ReactiveViewModel {
  final QuoteAndCategoryService _categoryService = locator<QuoteAndCategoryService>();
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  final PremiumConstants _premiumConstants = locator<PremiumConstants>();
  QuoteAndCategoryService get listenableCategoryService => listenableServices.first as QuoteAndCategoryService;
  ThemeConfigurationService get listenableThemeConfigurationService => listenableServices[1] as ThemeConfigurationService;

  List<QuoteModel> get currentQuoteList => listenableCategoryService.currentQuotes;

  List<Categories>? get selectedCategories => listenableCategoryService.selectedCategories;
  ThemeConfigurationModel get currentThemeConfiguration => listenableThemeConfigurationService.currentThemeConfiguration;

  QuoteModel get currentQuote => currentQuoteList.isNotEmpty ? currentQuoteList[_currentPage] : QuoteModel.empty();
  final ValueNotifier<bool> currentQuoteIsLiked = ValueNotifier<bool>(false);

  int get _currentPage => pageController.hasClients ? pageController.page!.round() : 0;

  /// Fetches quotes for the selected category.
  ///
  /// This method calls the [_categoryService.fetchQuotesForSelectedCategory] method to fetch quotes for the selected category.
  /// It takes the [context] parameter as the BuildContext, [categoryKey] parameter as the category key, and [locale] parameter as the language code of the context.
  /// If an error occurs during the fetching process, it catches the error.
  Future<void> init(BuildContext context) async {
    try {
      await runBusyFuture(
        Future.wait([
          _categoryService.init(),
          _themeConfigurationService.init(context),
        ]),
      );

      pageController.addListener(() {
        currentQuoteIsLiked.value = HiveService.instance.likedQuoteBoxService.isQuoteLiked(currentQuote.id);
      });
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  ///
  ///  UI Controllers
  ///
  final PageController pageController = PageController();

  Future<void> onPageChanged(int index) async {
    try {
      ///
      /// Check every time the page changes if the user should watch an ad to unlock quote swipe.
      /// If the user should watch an ad to unlock quote swipe, show an ad.
      /// If the user has watched the ad, unlock the quote swipe.
      ///
      if (_premiumConstants.shouldUserWatchAdToUnlockQuoteSwipe(index: index)) {
        debugPrint('User should watch ad to unlock quote swipe');
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_categoryService, _themeConfigurationService];
}
