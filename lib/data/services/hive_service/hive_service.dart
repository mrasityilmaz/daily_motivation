import 'package:daily_motivation/core/constants/hive_constants.dart';
import 'package:daily_motivation/data/models/hive_adapters/quote_hive_adapter/quote_hive_adapter.dart';
import 'package:daily_motivation/data/models/hive_adapters/reminder_hive_adapter/reminder_hive_adapter.dart';
import 'package:daily_motivation/data/models/hive_adapters/theme_config_adapter/theme_config_adapter.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/models/reminder_model/reminder_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'boxes/liked_quote_mixin.dart';
part 'boxes/my_quotes_mixin.dart';
part 'boxes/theme_config_mixin.dart';

@immutable
final class HiveService with _ThemeConfigurationServiceMixin, _MyQuotesServiceMixin, _LikedQuoteServiceMixin {
  factory HiveService() {
    return instance;
  }

  HiveService._internal();
  static final HiveService instance = HiveService._internal();

  ///
  ///
  ///

  final LikedQuoteBoxService likedQuoteBoxService = LikedQuoteBoxService(box: Hive.box<QuoteHiveModel>(HiveConstants.likedQuotesBoxKey));

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
      ..registerAdapter(ReminderHiveAdapter());

    await Future.wait([
      likedQuoteBoxService.initBox(),
    ]);

    await Hive.openBox<ThemeConfigurationModel>(HiveConstants.themeConfigurationBoxKey);
    await Hive.openBox<QuoteHiveModel>(HiveConstants.likedQuotesBoxKey);
    await Hive.openBox<QuoteHiveModel>(HiveConstants.myQuotesBoxKey);
    await Hive.openBox<ReminderModel>(HiveConstants.remindersBoxKey);
  }
}
