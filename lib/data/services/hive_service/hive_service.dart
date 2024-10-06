import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quotely/data/services/hive_service/boxes/category_service.dart';
import 'package:quotely/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/my_quote_service.dart';
import 'package:quotely/data/services/hive_service/boxes/quote_notification_service.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/boxes/theme_config_service.dart';
import 'package:quotely/data/services/hive_service/boxes/user_box.dart';

@immutable
@LazySingleton(order: 2)
final class HiveService {
  ///
  ///
  ///

  final LikedQuoteBoxService likedQuoteBoxService = LikedQuoteBoxService();
  final MyQuoteBoxService myQuoteBoxService = MyQuoteBoxService();
  final ThemeConfigurationBoxService themeConfigurationBoxService = ThemeConfigurationBoxService();
  final ReminderBoxService reminderBoxService = ReminderBoxService();
  final QuoteNotificationBoxService quoteNotificationBoxService = QuoteNotificationBoxService();
  final CategoryBoxService categoryBoxService = CategoryBoxService();
  final UserBoxService userBoxService = UserBoxService();

  @nonVirtual
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await HiveManager.instance.init(
      hiveBoxes: [
        userBoxService,
        likedQuoteBoxService,
        myQuoteBoxService,
        themeConfigurationBoxService,
        reminderBoxService,
        quoteNotificationBoxService,
        categoryBoxService,
      ],
    );
  }
}
