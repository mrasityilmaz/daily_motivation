import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/data/models/hive_adapters/quote_hive_adapter/quote_hive_adapter.dart';
import 'package:quotely/data/models/hive_adapters/quote_notification_hive_adapter/quote_notification_hive_adapter.dart';
import 'package:quotely/data/models/hive_adapters/reminder_hive_adapter/reminder_hive_adapter.dart';
import 'package:quotely/data/models/hive_adapters/theme_config_adapter/theme_config_adapter.dart';
import 'package:quotely/data/services/hive_service/boxes/category_service.dart';
import 'package:quotely/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/quote_notification_service.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/boxes/theme_config_service.dart';

@immutable
final class HiveService {
  factory HiveService() {
    return instance;
  }

  HiveService._internal();
  static final HiveService instance = HiveService._internal();

  ///
  ///
  ///

  final LikedQuoteBoxService likedQuoteBoxService = LikedQuoteBoxService(boxKey: HiveConstants.likedQuotesBoxKey);
  final MyQuoteBoxService myQuoteBoxService = MyQuoteBoxService(boxKey: HiveConstants.myQuotesBoxKey);
  final ThemeConfigurationBoxService themeConfigurationBoxService = ThemeConfigurationBoxService(boxKey: HiveConstants.themeConfigurationBoxKey);
  final ReminderBoxService reminderBoxService = ReminderBoxService(boxKey: HiveConstants.remindersBoxKey);
  final QuoteNotificationBoxService quoteNotificationBoxService = QuoteNotificationBoxService(boxKey: HiveConstants.quoteNotificationBoxKey);
  final CategoryBoxService categoryBoxService = CategoryBoxService(boxKey: HiveConstants.categoryBoxKey);

  ///
  ///
  ///
  ///

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    // await Hive.deleteBoxFromDisk(HiveConstants.themeConfigurationBoxKey);
    // await Hive.deleteBoxFromDisk(HiveConstants.likedQuotesBoxKey);

    Hive
      ..registerAdapter(ThemeConfigHiveAdapter())
      ..registerAdapter(QuoteHiveAdapter())
      ..registerAdapter(ReminderHiveAdapter())
      ..registerAdapter(ReminderNotificationEqualScheduleModelHiveAdapter())
      ..registerAdapter(ReminderNotificationScheduleCustomIntervalModelHiveAdapter())
      ..registerAdapter(QuoteNotificationHiveAdapter())
      ..registerAdapter(QuoteNotificationEqualScheduleModelHiveAdapter())
      ..registerAdapter(QuoteNotificationScheduleCustomIntervalModelHiveAdapter());

    await Future.wait([
      categoryBoxService.initBox(),
      likedQuoteBoxService.initBox(),
      myQuoteBoxService.initBox(),
      themeConfigurationBoxService.initBox(),
      reminderBoxService.initBox(),
      quoteNotificationBoxService.initBox(),
    ]);
  }
}
