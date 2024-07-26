import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/presentation/favorites_view/favorites_view.dart';
import 'package:quotely/presentation/home_view/home_view.dart';
import 'package:quotely/presentation/my_quotes_view/my_quotes_view.dart';
import 'package:quotely/presentation/my_quotes_view/subviews/add_new_or_edit_quote_view/add_new_or_edit_quote_view.dart';
import 'package:quotely/presentation/onboard_view/onboard_view.dart';
import 'package:quotely/presentation/quote_notifications_view/quote_notification_view.dart';
import 'package:quotely/presentation/reminders_view/reminders_view.dart';
import 'package:quotely/presentation/reminders_view/subviews/add_new_or_edit_reminder/add_new_or_edit_reminder_view.dart';

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
        AutoRoute(
          page: AddNewOrEditQuoteViewRoute.page,
        ),
        AutoRoute(page: RemindersViewRoute.page),
        AutoRoute(page: AddNewOrEditReminderViewRoute.page),
        AutoRoute(page: QuoteNotificationsViewRoute.page),
      ];
}
