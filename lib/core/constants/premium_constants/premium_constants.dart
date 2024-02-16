import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/core/services/premium_services/premium_services.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'category_constants_mixin.dart';
part 'quote_notification_contants_mixin.dart';
part 'quote_swipe_constants_mixin.dart';
part 'reminder_contants_mixin.dart';

@immutable
@lazySingleton
final class PremiumConstants with _PremiumConstantCategoryMixin, _PremiumConstantReminderMixin, _PremiumConstantQuoteNotificationMixin, _PremiumConstantQuoteSwipeMixin {
  factory PremiumConstants() {
    return instance;
  }

  PremiumConstants._internal();
  static PremiumConstants instance = PremiumConstants._internal();
}
