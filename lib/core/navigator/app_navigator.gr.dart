// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_navigator.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNewOrEditQuoteViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewOrEditQuoteViewRouteArgs>(
          orElse: () => const AddNewOrEditQuoteViewRouteArgs());
      return AutoRoutePage<QuoteHiveModel>(
        routeData: routeData,
        child: AddNewOrEditQuoteView<dynamic>(
          key: args.key,
          editQuote: args.editQuote,
        ),
      );
    },
    AddNewOrEditReminderViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewOrEditReminderViewRouteArgs>(
          orElse: () => const AddNewOrEditReminderViewRouteArgs());
      return AutoRoutePage<ReminderModel>(
        routeData: routeData,
        child: AddNewOrEditReminderView<dynamic>(
          key: args.key,
          editQuote: args.editQuote,
        ),
      );
    },
    FavoritesViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    MyQuotesViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyQuotesView(),
      );
    },
    OnboardViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
    RemindersViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RemindersView(),
      );
    },
  };
}

/// generated route for
/// [AddNewOrEditQuoteView<dynamic>]
class AddNewOrEditQuoteViewRoute
    extends PageRouteInfo<AddNewOrEditQuoteViewRouteArgs> {
  AddNewOrEditQuoteViewRoute({
    Key? key,
    QuoteHiveModel? editQuote,
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

  static const PageInfo<AddNewOrEditQuoteViewRouteArgs> page =
      PageInfo<AddNewOrEditQuoteViewRouteArgs>(name);
}

class AddNewOrEditQuoteViewRouteArgs {
  const AddNewOrEditQuoteViewRouteArgs({
    this.key,
    this.editQuote,
  });

  final Key? key;

  final QuoteHiveModel? editQuote;

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
    QuoteHiveModel? editQuote,
    List<PageRouteInfo>? children,
  }) : super(
          AddNewOrEditReminderViewRoute.name,
          args: AddNewOrEditReminderViewRouteArgs(
            key: key,
            editQuote: editQuote,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNewOrEditReminderViewRoute';

  static const PageInfo<AddNewOrEditReminderViewRouteArgs> page =
      PageInfo<AddNewOrEditReminderViewRouteArgs>(name);
}

class AddNewOrEditReminderViewRouteArgs {
  const AddNewOrEditReminderViewRouteArgs({
    this.key,
    this.editQuote,
  });

  final Key? key;

  final QuoteHiveModel? editQuote;

  @override
  String toString() {
    return 'AddNewOrEditReminderViewRouteArgs{key: $key, editQuote: $editQuote}';
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
}
