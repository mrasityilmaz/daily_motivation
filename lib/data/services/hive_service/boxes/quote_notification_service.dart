import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_notification_model/quote_notification_model.dart';
import 'package:quotely/data/services/hive_service/i_hivebox_service.dart';

final class QuoteNotificationBoxService extends IHiveBoxService<QuoteNotificationModel> {
  QuoteNotificationBoxService({required super.boxKey});

  @override
  Box<QuoteNotificationModel> get box => Hive.box<QuoteNotificationModel>(boxKey);

  QuoteNotificationModel? get quoteNotificationValue => box.values.firstOrNull;

  Future<void> addQuoteNotification(QuoteNotificationModel quoteNotificationModel) async {
    try {
      await box.put(quoteNotificationModel.notificationId, quoteNotificationModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteQuoteNotification(String key) async {
    try {
      await box.delete(key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> updateQuoteNotification(String key, QuoteNotificationModel quoteNotificationModel) async {
    try {
      await box.put(key, quoteNotificationModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearQuoteNotifications() async {
    try {
      await super.clearBox();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
