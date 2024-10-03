@MappableLib(generateInitializerForScope: InitializerScope.package)
library main;

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/notification_service/notification_service.dart';
import 'package:quotely/data/services/user_service/user_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/main.init.dart';
import 'package:quotely/shared/app_theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  stderr.write('Handling a background message: ${message.messageId}');

  return Future(() async {
    final service = NotificationService();

    await service.initService();

    await service.showNotification(
      message: 'Hello from the background! - \n${message.toMap()} - ${DateTime.now()}',
    );

    // final DateTime now = DateTime.now();
    // await Future.wait(
    //   List<int>.generate(60, (index) => index * 3).map(
    //     (item) async {
    //       await service.scheduleNotification(
    //         time: now.add(Duration(seconds: item)),
    //         message: 'Scheduled from the background! - $item}',
    //       );
    //     },
    //   ),
    // );
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

Future<String?> getToken() async {
  final String? token = await FirebaseMessaging.instance.getToken();

  return token;
  print('FCM Token: $token');
  // Token'i Firebase konsoluna veya sunucunuza gönderin.
}

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    initializeMappers();

    await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
        );

    // await FirebaseAppCheck.instance.activate(
    //   androidProvider: AndroidProvider.debug,
    //   appleProvider: AppleProvider.appAttest,
    // );

    await configureDependencies(defaultEnv: Environment.prod);

    // await clearAppCache();

    // clearImageCache();

    await locator<NotificationService>().initService();

    await EasyLocalization.ensureInitialized();

    await MobileAds.instance.initialize();

    await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8082);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

    final UserService userService = UserService();
    final String deviceId = await FlutterUdid.udid;

    final userCustomToken = await userService.createCustomToken(uid: deviceId, deviceId: deviceId);

    await userService.createUserWithCustomToken(token: userCustomToken);

    await DeviceInfoPlugin().deviceInfo.then((BaseDeviceInfo deviceInfo) async {
      LoggerService.printLog(
        'Device Info: ${deviceInfo.data}',
      );

      // await locator<UserRepository>().createNewUser(
      //   userModel: UserModel(
      //     timeZone: locator<NotificationService>().userTimeZone,
      //     deviceId: deviceId,
      //     sendNotifications: locator<NotificationService>().isNotificationPermissionGranted.value,
      //   ),
      // );
    });

    await FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await getToken();

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
      LoggerService.printErrorLog(error, stack);
    }
  });

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (kDebugMode) {
      LoggerService.printErrorLog(
        details.exception,
        details.stack ?? StackTrace.current,
      );
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
