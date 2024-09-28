// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'data/models/firestore_models/user_model/user_model.dart' as p0;
import 'data/models/quote_model/quote_model.dart' as p1;
import 'data/models/quote_notification_model/custom_interval_model.dart' as p2;
import 'data/models/quote_notification_model/equal_schedule_model.dart' as p3;
import 'data/models/quote_notification_model/quote_notification_model.dart'
    as p4;
import 'data/models/reminder_model/reminder_model.dart' as p5;
import 'data/models/theme_configuration_model/theme_configuration_model.dart'
    as p6;
import 'data/models/user_schedule_times_model/user_schedule_times_model.dart'
    as p7;

void initializeMappers() {
  p0.UserModelMapper.ensureInitialized();
  p1.QuoteModelMapper.ensureInitialized();
  p2.QuoteNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
  p3.QuoteNotificationEqualScheduleModelMapper.ensureInitialized();
  p4.QuoteNotificationModelMapper.ensureInitialized();
  p5.ReminderModelMapper.ensureInitialized();
  p5.ReminderNotificationEqualScheduleModelMapper.ensureInitialized();
  p5.ReminderNotificationScheduleCustomIntervalModelMapper.ensureInitialized();
  p6.ThemeConfigurationModelMapper.ensureInitialized();
  p7.UserNotificationScheduleTimesMapper.ensureInitialized();
}
