// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:quotely/core/services/logger_service.dart';
// import 'package:quotely/core/services/notification_service/notification_service.dart';
// import 'package:quotely/injection/injection_container.dart';
// import 'package:workmanager/workmanager.dart';

// part 'worker_constants.dart';

// /// This must be a top-level function
// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     try {
//       await configureDependencies();
//       await locator<NotificationService>().initService();
//       await locator<NotificationService>()
//           .showNotification(message: 'Hello from the background! - $task - ${DateTime.now()}');
//     } catch (e) {
//       return Future.error(e);
//     }
//     const bool success = true;
//     return Future.value(success);
//   });
// }

// @immutable
// @lazySingleton
// final class AppWorkManager with _WorkerConstants {
//   @mustCallSuper
//   Future<void> initialize() async {
//     try {
//       await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
//       await Workmanager().checkBackgroundRefreshPermission();

//       LoggerService.printLog('WorkManager initialized');
//     } catch (e, s) {
//       LoggerService.catchLog(e, s);
//     }
//   }

//   Future<void> schedulePeriodicTask() async {
//     try {
//       final perm = await Workmanager().checkBackgroundRefreshPermission().then((permissionStatus) {
//         if (permissionStatus == BackgroundRefreshPermissionState.available) {
//           LoggerService.printLog('Background refresh is enabled');

//           return true;
//         } else {
//           LoggerService.printLog('Background refresh is not enabled');
//           return false;
//         }
//       });

//       if (!perm) {
//         return;
//       }

//       await Workmanager().cancelAll();

//       await Workmanager().registerPeriodicTask(
//         _kIOSPeriodicTaskIdentifier,
//         '$_kIOSPeriodicTaskIdentifier.123',
//         frequency: const Duration(minutes: 15),
//         initialDelay: const Duration(seconds: 10),
//         existingWorkPolicy: ExistingWorkPolicy.keep,
//         backoffPolicy: BackoffPolicy.linear,
//         backoffPolicyDelay: const Duration(seconds: 10),
//         constraints: Constraints(
//           networkType: NetworkType.not_required,
//           requiresBatteryNotLow: false,
//           requiresCharging: false,
//           requiresDeviceIdle: false,
//           requiresStorageNotLow: false,
//         ),
//       );

//       await Workmanager().printScheduledTasks();
//     } catch (e, s) {
//       LoggerService.catchLog(e, s);
//     }
//   }
// }
