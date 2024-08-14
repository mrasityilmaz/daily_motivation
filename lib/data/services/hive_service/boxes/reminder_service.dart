import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';

@immutable
final class ReminderBoxService extends HiveBoxService<ReminderModel> {
  ReminderBoxService({required super.boxName});

  List<ReminderModel> get reminderList => box.getAll(box.keys).nonNulls.toList();

  Future<void> addReminder(ReminderModel reminder) async {
    try {
      box.put(reminder.notificationId, reminder);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteReminder(String key) async {
    try {
      box.delete(key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> updateReminder(String key, ReminderModel reminder) async {
    try {
      box.put(key, reminder);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  void clearReminders() {
    try {
      box.clear();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
