// ignore_for_file: comment_references

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/constants/premium_constants/quote_swipe_constants_mixin.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/data/services/quote_and_category_service/quote_and_category_service.dart';
import 'package:quotely/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:stacked/stacked.dart' hide PageRouteInfo;

final class HomeViewModel extends ReactiveViewModel with PremiumConstantQuoteSwipeMixin {
  ///
  /// Define the services
  ///
  final QuoteAndCategoryService _categoryService = locator<QuoteAndCategoryService>();
  final ThemeConfigurationService _themeConfigurationService = locator<ThemeConfigurationService>();
  final PremiumServices _premiumServices = locator<PremiumServices>();

  ///
  /// Getters for the services and the current state of the services
  ///

  ///
  /// Getters for the current values of the services
  ///
  List<QuoteModel> get currentQuoteList => _categoryService.currentQuotes;

  Categories get selectedCategory => _categoryService.selectedCategory;
  ThemeConfigurationModel get currentThemeConfiguration => _themeConfigurationService.currentThemeConfiguration;

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
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  /// When the page changes, this method checks if the current quote is liked.
  @protected
  void checkCurrentQuoteIsLiked() {
    currentQuoteIsLiked.value = locator<HiveService>().likedQuoteBoxService.isQuoteLiked(currentQuote.id);
  }

  ///
  ///
  ///  UI Controllers
  ///
  final PageController pageController = PageController();

  Future<void> onPageChanged(int index) async {
    try {
      checkCurrentQuoteIsLiked();

      ///
      /// Check every time the page changes if the user should watch an ad to unlock quote swipe.
      /// If the user should watch an ad to unlock quote swipe, show an ad.
      /// If the user has watched the ad, unlock the quote swipe.
      ///
      if (shouldUserWatchAdToUnlockQuoteSwipe(index: index)) {
        debugPrint('User should watch ad to unlock quote swipe');

        // TODO - Show ad and unlock quote swipe
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  ///
  /// Quote Like Function
  ///

  Future<void> toggleLike() async {
    final bool isLiked = locator<HiveService>().likedQuoteBoxService.isQuoteLiked(currentQuote.id);
    if (isLiked) {
      await locator<HiveService>().likedQuoteBoxService.unLikeQuote(currentQuote.id);
      currentQuoteIsLiked.value = false;
    } else {
      await locator<HiveService>().likedQuoteBoxService.likeQuote(currentQuote);
      currentQuoteIsLiked.value = true;
    }
    await HapticFeedback.mediumImpact();
  }

  ///
  ///
  ///

  @override
  void dispose() {
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_categoryService, _themeConfigurationService, _premiumServices];
}
