import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();

  ///
  /// Configure Dependencies for the GetIt Service Locator
  ///
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      darkTheme: AppTheme().darkTheme,
      lightTheme: AppTheme().lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          builder: (context, child) {
            return AnimatedTheme(
              data: themeMode == ThemeMode.dark ? AppTheme().darkTheme : AppTheme().lightTheme,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutExpo,
              child: child!,
            );
          },
          routerConfig: locator<AppRouter>().config(),
        );
      },
    );
  }
}
