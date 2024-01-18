import 'dart:async';

import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/shared/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ThemeManager.initialise();
    await EasyLocalization.ensureInitialized();

    await HiveService.instance.init();

    ///
    await configureDependencies();

    /// Configure Dependencies for the GetIt Service Locator
    ///

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        startLocale: const Locale('tr', 'TR'),
        fallbackLocale: const Locale('tr', 'TR'),
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    );
  }, (Object error, StackTrace stack) async {
    if (kDebugMode) {
      LoggerService.instance.printErrorLog(error, stack);
    }
  });

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (kDebugMode) {
      LoggerService.instance.printErrorLog(details.exception, details.stack ?? StackTrace.current);
    }
  };
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      darkTheme: AppTheme.instance.darkTheme,
      lightTheme: AppTheme.instance.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          title: 'Daily Motivation',
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: locator<AppRouter>().config(),
        );
      },
    );
  }
}
