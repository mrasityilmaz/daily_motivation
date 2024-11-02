import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/notification_service/notification_service.dart';
import 'package:quotely/firebase_options.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/main.dart';
import 'package:quotely/main.init.dart';

@immutable
final class MainInitializer {
  /// Initializes of all the services and dependencies
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    initializeMappers();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // await FirebaseAppCheck.instance.activate(
    //   androidProvider: AndroidProvider.debug,
    //   appleProvider: AppleProvider.appAttest,
    // );

    await configureDependencies(defaultEnv: Environment.prod);

//     await locator<NotificationService>().initService();

    await EasyLocalization.ensureInitialized();

    await MobileAds.instance.initialize();

    // await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

    // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8082);
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

    await FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Disable EasyLocalization logger outputs
    EasyLocalization.logger.enableBuildModes = const [];

    FlutterError.onError = onFlutterError;
  }

  /// When main zone error occurs
  static void onErrorZone(Object error, StackTrace stackTrace) {
    LoggerService.catchLog(error, stackTrace, 'Zone Error');
  }

  /// When Flutter error occurs
  static void onFlutterError(FlutterErrorDetails details) {
    LoggerService.catchLog(
      details.exception,
      details.stack ?? StackTrace.current,
      'Flutter Error',
      details.toString(
        minLevel: DiagnosticLevel.warning,
      ),
    );
  }

  /// TODO - Seperate this to another file
  static Future<void> fBMHandler(RemoteMessage message) async {
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

  /// TODO - Seperate this to another file
  static void notificationTapBackground(NotificationResponse notificationResponse) {
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
}
