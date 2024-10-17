/// This function detects all @Mappable annotations in the project and generates the mappers.
/// It's intended to be in the main.init.dart file.
@MappableLib(generateInitializerForScope: InitializerScope.package)
library main;

import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quotely/app_initializer.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/shared/app_theme.dart';

/// This must be a top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) => AppInitializer.fBMHandler(message);

/// This must be a top-level function
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) =>
    AppInitializer.notificationTapBackground(notificationResponse);

void main() async {
  await runZonedGuarded(
    () async {
      await AppInitializer.initialize();

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
    },
    AppInitializer.onErrorZone,
  );

  FlutterError.onError = AppInitializer.onFlutterError;
}

@immutable
final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeAnimationCurve: Easing.emphasizedAccelerate,
      themeAnimationDuration: Durations.medium1,
      title: 'Quotely',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.instance.themeData,
      darkTheme: AppThemeManager.instance.darkThemeData,
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: locator<AppRouter>().config(),
    );
  }
}
