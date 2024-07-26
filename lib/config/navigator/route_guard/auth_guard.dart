import 'package:auto_route/auto_route.dart';

final class AuthGuard extends AutoRouteGuard {
  factory AuthGuard() => instance;

  AuthGuard._internal();
  static final AuthGuard instance = AuthGuard._internal();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // FlutterNativeSplash.remove();
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation

    // if (locator<AuthService>().userToken.isNotEmpty) {
    //   // if user is authenticated we continue

    //   resolver.next();
    // } else {
    //   if (resolver.routeName == SignInViewRoute.name) {
    //     resolver.next();
    //   } else {
    //     router.push(const SignInViewRoute());
    //   }
    // }

    resolver.next();
  }
}
