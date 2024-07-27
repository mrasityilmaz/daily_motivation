import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/main.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'helpers/constant_variables/constant_variables.dart';
part 'helpers/initial_configuration.dart';
part 'helpers/initialization_helpers/android_helper.dart';
part 'helpers/initialization_helpers/darwin_helper.dart';
part 'helpers/initialization_helpers/linux_helper.dart';

@lazySingleton
final class NotificationService extends _InitialConfigurationBase {
  NotificationService();

  Future<void> initService() async {
    await configureLocalTimeZone();
    await configureAppLaunchDetails();
    await initializeLocalNotificationPlugin();
  }
}
