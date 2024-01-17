import 'package:daily_motivation/core/constants/hive_constants.dart';
import 'package:daily_motivation/data/models/hive_adapters/quote_config_adapter/quote_config_adapter.dart';
import 'package:daily_motivation/data/models/hive_adapters/theme_config_adapter/theme_config_adapter.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'mixin/liked_quote_mixin.dart';
part 'mixin/theme_config_mixin.dart';

@immutable
final class HiveService with _ThemeConfigurationServiceMixin, _LikedQuoteServiceMixin {
  factory HiveService() {
    return instance;
  }

  HiveService._internal();
  static final HiveService instance = HiveService._internal();

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    // await Hive.deleteBoxFromDisk(HiveConstants.themeConfigurationBoxKey);
    // await Hive.deleteBoxFromDisk(HiveConstants.likedQuotesBoxKey);

    Hive
      ..registerAdapter(ThemeConfigHiveAdapter())
      ..registerAdapter(QuoteHiveAdapter());

    await Hive.openBox<ThemeConfigurationModel>(HiveConstants.themeConfigurationBoxKey);
    await Hive.openBox<QuoteHiveModel>(HiveConstants.likedQuotesBoxKey);
  }
}
