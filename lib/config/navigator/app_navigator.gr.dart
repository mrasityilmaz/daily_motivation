// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_navigator.dart';

/// generated route for
/// [AddNewOrEditQuoteView<dynamic>]
class AddNewOrEditQuoteViewRoute
    extends PageRouteInfo<AddNewOrEditQuoteViewRouteArgs> {
  AddNewOrEditQuoteViewRoute({
    Key? key,
    QuoteModel? editQuote,
    List<PageRouteInfo>? children,
  }) : super(
          AddNewOrEditQuoteViewRoute.name,
          args: AddNewOrEditQuoteViewRouteArgs(
            key: key,
            editQuote: editQuote,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewOrEditQuoteViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewOrEditQuoteViewRouteArgs>(
          orElse: () => const AddNewOrEditQuoteViewRouteArgs());
      return AddNewOrEditQuoteView<dynamic>(
        key: args.key,
        editQuote: args.editQuote,
      );
    },
  );
}

class AddNewOrEditQuoteViewRouteArgs {
  const AddNewOrEditQuoteViewRouteArgs({
    this.key,
    this.editQuote,
  });

  final Key? key;

  final QuoteModel? editQuote;

  @override
  String toString() {
    return 'AddNewOrEditQuoteViewRouteArgs{key: $key, editQuote: $editQuote}';
  }
}

/// generated route for
/// [AddNewOrEditReminderView<dynamic>]
class AddNewOrEditReminderViewRoute
    extends PageRouteInfo<AddNewOrEditReminderViewRouteArgs> {
  AddNewOrEditReminderViewRoute({
    Key? key,
    ReminderModel? reminder,
    List<PageRouteInfo>? children,
  }) : super(
          AddNewOrEditReminderViewRoute.name,
          args: AddNewOrEditReminderViewRouteArgs(
            key: key,
            reminder: reminder,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewOrEditReminderViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewOrEditReminderViewRouteArgs>(
          orElse: () => const AddNewOrEditReminderViewRouteArgs());
      return AddNewOrEditReminderView<dynamic>(
        key: args.key,
        reminder: args.reminder,
      );
    },
  );
}

class AddNewOrEditReminderViewRouteArgs {
  const AddNewOrEditReminderViewRouteArgs({
    this.key,
    this.reminder,
  });

  final Key? key;

  final ReminderModel? reminder;

  @override
  String toString() {
    return 'AddNewOrEditReminderViewRouteArgs{key: $key, reminder: $reminder}';
  }
}

/// generated route for
/// [FavoritesView]
class FavoritesViewRoute extends PageRouteInfo<void> {
  const FavoritesViewRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [MyQuotesView]
class MyQuotesViewRoute extends PageRouteInfo<void> {
  const MyQuotesViewRoute({List<PageRouteInfo>? children})
      : super(
          MyQuotesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyQuotesViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyQuotesView();
    },
  );
}

/// generated route for
/// [OnboardView]
class OnboardViewRoute extends PageRouteInfo<void> {
  const OnboardViewRoute({List<PageRouteInfo>? children})
      : super(
          OnboardViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardView();
    },
  );
}

/// generated route for
/// [QuoteNotificationsView]
class QuoteNotificationsViewRoute extends PageRouteInfo<void> {
  const QuoteNotificationsViewRoute({List<PageRouteInfo>? children})
      : super(
          QuoteNotificationsViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuoteNotificationsViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuoteNotificationsView();
    },
  );
}

/// generated route for
/// [RemindersView]
class RemindersViewRoute extends PageRouteInfo<void> {
  const RemindersViewRoute({List<PageRouteInfo>? children})
      : super(
          RemindersViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemindersViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RemindersView();
    },
  );
}
