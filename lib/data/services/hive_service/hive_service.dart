import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/core/constants/hive_constants.dart';
import 'package:quotely/data/services/hive_service/boxes/category_service.dart';
import 'package:quotely/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/quote_notification_service.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/boxes/theme_config_service.dart';

@LazySingleton()
@immutable
final class HiveService {
  ///
  ///
  ///

  final LikedQuoteBoxService likedQuoteBoxService = LikedQuoteBoxService(boxName: HiveConstants.likedQuotesBoxKey);
  final MyQuoteBoxService myQuoteBoxService = MyQuoteBoxService(boxName: HiveConstants.myQuotesBoxKey);
  final ThemeConfigurationBoxService themeConfigurationBoxService =
      ThemeConfigurationBoxService(boxName: HiveConstants.themeConfigurationBoxKey);
  final ReminderBoxService reminderBoxService = ReminderBoxService(boxName: HiveConstants.remindersBoxKey);
  final QuoteNotificationBoxService quoteNotificationBoxService =
      QuoteNotificationBoxService(boxName: HiveConstants.quoteNotificationBoxKey);
  final CategoryBoxService categoryBoxService = CategoryBoxService(boxName: HiveConstants.categoryBoxKey);

  ///
  ///
  ///
  ///

  Future<void> init() async {
    await HiveManager.instance.init(
      hiveBoxes: [
        likedQuoteBoxService,
        myQuoteBoxService,
        themeConfigurationBoxService,
        reminderBoxService,
        quoteNotificationBoxService,
        categoryBoxService,
      ],
    );

    // Hive.defaultDirectory = appDocumentDir.path;

    // await Hive.deleteBoxFromDisk(HiveConstants.themeConfigurationBoxKey);
    // await Hive.deleteBoxFromDisk(HiveConstants.likedQuotesBoxKey);
  }
}
