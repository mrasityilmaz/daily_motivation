import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/presentation/views/favorites_view/favorites_view.dart';
import 'package:quotely/presentation/views/home_view/home_view.dart';
import 'package:quotely/presentation/views/my_quotes_view/my_quotes_view.dart';
import 'package:quotely/presentation/views/my_quotes_view/subviews/add_new_or_edit_quote_view/add_new_or_edit_quote_view.dart';
import 'package:quotely/presentation/views/onboard_view/onboard_view.dart';
import 'package:quotely/presentation/views/quote_notifications_view/quote_notification_view.dart';
import 'package:quotely/presentation/views/reminders_view/reminders_view.dart';
import 'package:quotely/presentation/views/reminders_view/subviews/add_new_or_edit_reminder/add_new_or_edit_reminder_view.dart';
import 'package:quotely/presentation/views/sign_view/login_view/login_view.dart';
import 'package:quotely/presentation/views/sign_view/signup_view/signup_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@LazySingleton(order: 1)
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute<void>(
          page: OnboardViewRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          // initial: true,
        ),
        AutoRoute(page: LoginViewRoute.page),
        AutoRoute(page: SignUpViewRoute.page),
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
