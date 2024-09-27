// ignore_for_file: avoid_final_parameters, invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/data/models/quote_notification_model/custom_interval_model.dart';
import 'package:quotely/data/models/quote_notification_model/equal_schedule_model.dart';

part 'quote_notification_model.mapper.dart';

@MappableClass()
final class QuoteNotificationModel with QuoteNotificationModelMappable {
  const QuoteNotificationModel({
    required this.notificationId,
    required this.notificationCategories,
    required this.notificationDaysInWeek,
    this.notificationEqualSchedule,
    this.notificationCustomIntervalSchedule,
  });

  final String notificationId;
  @MappableEnum(mode: ValuesMode.named)
  final List<Categories> notificationCategories;
  final List<int> notificationDaysInWeek;
  final QuoteNotificationEqualScheduleModel? notificationEqualSchedule;
  final QuoteNotificationScheduleCustomIntervalModel? notificationCustomIntervalSchedule;

  static const fromMap = QuoteNotificationModelMapper.fromMap;
  static const fromJson = QuoteNotificationModelMapper.fromJson;
}
