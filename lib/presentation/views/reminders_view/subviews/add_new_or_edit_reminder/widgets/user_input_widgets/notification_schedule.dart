part of '../../add_new_or_edit_reminder_view.dart';

@immutable
final class _NotificationScheduleSection extends StatelessWidget {
  const _NotificationScheduleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Schedule',
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
        ),
        const __WeekDaysRow(),
        SizedBox(
          height: context.lowValue,
        ),
        const __ScheduleModeSelectButton(
          type: ReminderScheduleEnum.equalInterval,
          title: 'Equal Interval',
          subTitle: 'Başlangıç ve bitiş saatlari arasında seçilen aralıkta bildirim gönderilir',
        ),
        const _EqualIntervalSection(),
        SizedBox(
          height: context.lowValue,
        ),
        const __ScheduleModeSelectButton(
          type: ReminderScheduleEnum.customInterval,
          title: 'Custom Times',
          subTitle: 'İstenilen saatlerde bildirim gönderilir',
        ),
        const _CustomIntervalSection(),
      ],
    );
  }
}
