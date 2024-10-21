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
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/constants/enums/locales.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/main_initializer.dart';
import 'package:quotely/shared/app_theme.dart';

/// This must be a top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) => MainInitializer.fBMHandler(message);

/// This must be a top-level function
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) =>
    MainInitializer.notificationTapBackground(notificationResponse);

void main() async {
  await runZonedGuarded(
    () async {
      await MainInitializer.initialize();
      runApp(
        const _EasyLocalizationWrapper(),
      );
    },
    MainInitializer.onErrorZone,
  );
}

@immutable
final class _EasyLocalizationWrapper extends StatelessWidget {
  const _EasyLocalizationWrapper();

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: Locales.values.map((e) => e.locale).toList(),
      path: 'assets/translations',
      startLocale: Locales.tr.locale,
      fallbackLocale: Locales.tr.locale,
      useOnlyLangCode: true,
      child: const _MyApp(),
    );
  }
}

@immutable
final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeAnimationCurve: Easing.emphasizedAccelerate,
      themeAnimationDuration: Durations.medium1,
      title: 'Quotely',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.instance.darkThemeData,
      darkTheme: AppThemeManager.instance.darkThemeData,
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: locator<AppRouter>().config(),
    );
  }
}
