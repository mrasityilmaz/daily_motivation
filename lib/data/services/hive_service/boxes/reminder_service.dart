import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/data/services/hive_service/i_hivebox_service.dart';

final class ReminderBoxService extends IHiveBoxService<ReminderModel> {
  ReminderBoxService({required super.boxKey});

  @override
  Box<ReminderModel> get box => Hive.box<ReminderModel>(boxKey);

  List<ReminderModel> get reminderList => box.values.toList();

  Future<void> addReminder(ReminderModel reminder) async {
    try {
      await box.put(reminder.notificationId, reminder);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteReminder(String key) async {
    try {
      await box.delete(key);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> updateReminder(String key, ReminderModel reminder) async {
    try {
      await box.put(key, reminder);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> clearReminders() async {
    try {
      await super.clearBox();
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }
}
