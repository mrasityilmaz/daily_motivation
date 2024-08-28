import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/notification_service/notification_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/firebase_options.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/shared/app_theme.dart';
import 'package:stacked_themes/stacked_themes.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  stderr.write('Handling a background message: ${message.messageId}');

  return Future(() async {
    final service = NotificationService();

    await service.initService();

    await service.showNotification(message: 'Hello from the background! - ${message.data} - ${DateTime.now()}');

    final DateTime now = DateTime.now();
    await Future.wait(
      List<int>.generate(60, (index) => index * 3).map(
        (item) async {
          await service.scheduleNotification(
            time: now.add(Duration(seconds: item)),
            message: 'Scheduled from the background! - $item}',
          );
        },
      ),
    );
  }).timeout(const Duration(seconds: 30));
}

/// This must be a top-level function
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
      'notification action tapped with input: ${notificationResponse.input}',
    );
  }
}

Future<void> getToken() async {
  final String? token = await FirebaseMessaging.instance.getToken();

  print('FCM Token: $token');
  // Token'i Firebase konsoluna veya sunucunuza gönderin.
}

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await configureDependencies();
    await ThemeManager.initialise();

    // await locator<AppWorkManager>().initialize();

    // await clearAppCache();

    // clearImageCache();

    await locator<NotificationService>().initService();

    await locator<NotificationService>().cancelAllNotifications();

    await EasyLocalization.ensureInitialized();

    await MobileAds.instance.initialize();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.requestPermission();
    // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true, // Required to display a heads up notification
    //   badge: true,
    //   sound: true,
    // );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');
    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    // });

    await getToken();

    await locator<HiveService>().init();

    // Disable EasyLocalization logger outputs
    EasyLocalization.logger.enableBuildModes = const [];

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

Future<void> clearAppCache() async {
  // Cache directory'yi temizle
  final cacheDir = await getTemporaryDirectory();
  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }

  // Temporary directory'yi temizle
  final tempDir = await getTemporaryDirectory();
  if (tempDir.existsSync()) {
    tempDir.deleteSync(recursive: true);
  }
}

void clearImageCache() {
  PaintingBinding.instance.imageCache.clear();
  PaintingBinding.instance.imageCache.clearLiveImages();
}

@immutable
final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      darkTheme: AppThemeManager.instance.darkThemeData,
      lightTheme: AppThemeManager.instance.lightThemeData,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          themeAnimationCurve: Easing.emphasizedAccelerate,
          themeAnimationDuration: Durations.medium1,
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
