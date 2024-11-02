import 'package:easy_localization/easy_localization.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

enum WeekdayEnum {
  monday(dayIndex: 0),
  tuesday(dayIndex: 1),
  wednesday(dayIndex: 2),
  thursday(dayIndex: 3),
  friday(dayIndex: 4),
  saturday(dayIndex: 5),
  sunday(dayIndex: 6);

  const WeekdayEnum({required this.dayIndex});

  final int dayIndex;

  String get dayName {
    return tr('${LocaleKeys.weekdays}.${dayIndex + 1}');
  }
}
