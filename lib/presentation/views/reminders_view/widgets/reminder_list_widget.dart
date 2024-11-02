part of '../reminders_view.dart';

@immutable
final class _ReminderListItemWidget extends ViewModelWidget<_RemindersViewModel> {
  const _ReminderListItemWidget({required this.reminder}) : super(reactive: false);
  final ReminderModel reminder;

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.lowBottom(),
      child: Slidable(
        key: ValueKey(reminder.notificationId),

        // Action Pane
        endActionPane: _EndActionPane(reminder: reminder).build(context, viewModel),

        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: context.colors.onSurface.withOpacity(.05),
            borderRadius: const RadiusConstants.allLow(),
          ),
          padding: const PaddingConstants.lowHorizontal() + const PaddingConstants.lowVertical() * 1.2,

          // Reminder Details
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reminder.notificationTitle,
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              const Gap.tinyHeight() * .5,
              Text(
                reminder.notificationBody,
                style: context.textTheme.titleSmall?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              _WeekDaysRow(reminder: reminder),
              if (reminder.notificationEqualSchedule != null) ...[
                _EqualScheduleDetails(reminder: reminder),
              ] else if (reminder.notificationCustomIntervalSchedule != null) ...[
                _CustomScheduleDetails(reminder: reminder),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
final class _CustomScheduleDetails extends StatelessWidget {
  const _CustomScheduleDetails({
    required this.reminder,
  });

  final ReminderModel reminder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText.rich(
            TextSpan(
              text: '',
              children: reminder.notificationCustomIntervalSchedule!.notificationSchedules
                  .map(
                    (e) => TextSpan(
                      text:
                          "${e.format(context)}${reminder.notificationCustomIntervalSchedule!.notificationSchedules.last == e ? '' : ', '}",
                      style: context.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                    ),
                  )
                  .toList(),
            ),
            maxLines: 2,
            maxFontSize: context.textTheme.titleSmall!.fontSize!,
            minFontSize: context.textTheme.labelSmall!.fontSize!,
            style: context.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}

@immutable
final class _EqualScheduleDetails extends StatelessWidget {
  const _EqualScheduleDetails({
    required this.reminder,
  });

  final ReminderModel reminder;
  // TODO
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AutoSizeText.rich(
            TextSpan(
              text: 'Start from ',
              children: [
                TextSpan(
                  text: reminder.notificationEqualSchedule!.notificationStartTime?.format(context),
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                ),
                const TextSpan(
                  text: '\rto\r',
                ),
                TextSpan(
                  text: reminder.notificationEqualSchedule!.notificationEndTime?.format(context),
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                ),
                TextSpan(
                  text: ' - ${reminder.notificationEqualSchedule!.notificationInterval!} times a day',
                  style: context.textTheme.titleSmall,
                ),
              ],
            ),
            maxLines: 1,
            maxFontSize: context.textTheme.titleSmall!.fontSize!,
            minFontSize: context.textTheme.labelSmall!.fontSize!,
            style: context.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}

@immutable
final class _WeekDaysRow extends StatelessWidget {
  const _WeekDaysRow({
    required this.reminder,
  });

  final ReminderModel reminder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingConstants.lowVertical(),
      child: Row(
        children: (List<int>.from(reminder.notificationDaysInWeek, growable: false)..sort())
            .map(
              (e) => Container(
                margin: const PaddingConstants.lowRight() * .5,
                padding: const PaddingConstants.allLow() * .5,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      width: 1.2,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                child: AutoSizeText(
                  WeekdayEnum.values.elementAt(e).dayName,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  maxFontSize: context.textTheme.bodySmall!.fontSize!,
                  minFontSize: context.textTheme.labelSmall!.fontSize!,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

@immutable
final class _EndActionPane extends ViewModelWidget<_RemindersViewModel> {
  const _EndActionPane({
    required this.reminder,
  }) : super(reactive: false);

  final ReminderModel reminder;

  @override
  ActionPane build(BuildContext context, _RemindersViewModel viewModel) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (ctx) async => viewModel.onPressedDeleteReminderButton(reminder.notificationId),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: context.colors.surface,
          label: LocaleKeys.remove.tr(),
          icon: Platform.isAndroid ? Icons.delete_outline_rounded : CupertinoIcons.trash,
          padding: EdgeInsets.zero,
          foregroundColor: Colors.red.shade600,
        ),
        SlidableAction(
          onPressed: (ctx) async => viewModel.onTapEditReminder(reminder),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: context.colors.surface,
          label: LocaleKeys.edit.tr(),
          icon: Platform.isAndroid ? Icons.edit_note_rounded : CupertinoIcons.pencil_circle,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
