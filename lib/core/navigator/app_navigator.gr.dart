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
    OnboardViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
  };
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
