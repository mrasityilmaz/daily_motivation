import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_notification_model/quote_notification_model.dart';

@immutable
final class QuoteNotificationBoxService extends HiveBoxService<QuoteNotificationModel> {
  QuoteNotificationBoxService({required super.boxName, super.fromJson = QuoteNotificationModel.fromMap});

  QuoteNotificationModel? get quoteNotificationValue => box.keys.isEmpty ? null : box.get(box.keys.first);

  Future<void> addQuoteNotification(QuoteNotificationModel quoteNotificationModel) async {
    try {
      box.put(quoteNotificationModel.notificationId, quoteNotificationModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteQuoteNotification(String key) async {
    try {
      box.delete(key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> updateQuoteNotification(String key, QuoteNotificationModel quoteNotificationModel) async {
    try {
      box.put(key, quoteNotificationModel);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void clearQuoteNotifications() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
