import 'package:auto_route/auto_route.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/presentation/favorites_view/favorites_view.dart';
import 'package:daily_motivation/presentation/home_view/home_view.dart';
import 'package:daily_motivation/presentation/my_quotes_view/my_quotes_view.dart';
import 'package:daily_motivation/presentation/my_quotes_view/subviews/add_new_or_edit_quote_view.dart';
import 'package:daily_motivation/presentation/onboard_view/onboard_view.dart';
import 'package:daily_motivation/presentation/reminders_view/reminders_view.dart';
import 'package:daily_motivation/presentation/reminders_view/subviews/add_new_or_edit_reminder_view.dart';
import 'package:injectable/injectable.dart';

part 'app_navigator.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: OnboardViewRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          // initial: true,
        ),
        AutoRoute(page: HomeViewRoute.page, initial: true),
        AutoRoute(page: FavoritesViewRoute.page),
        AutoRoute(
          page: MyQuotesViewRoute.page,
        ),
        AutoRoute(page: AddNewOrEditQuoteViewRoute.page),
        AutoRoute(page: RemindersViewRoute.page),
        AutoRoute(page: AddNewOrEditReminderViewRoute.page),
      ];
}
