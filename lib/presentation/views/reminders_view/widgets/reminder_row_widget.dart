part of '../reminders_view.dart';

@immutable
final class _ReminderRowWidget extends ViewModelWidget<_RemindersViewModel> {
  const _ReminderRowWidget({required this.reminder}) : super(reactive: false);
  final ReminderModel reminder;

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return Padding(
      padding: context.paddingLowBottom,
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: ValueKey(reminder.notificationId),

        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) async => viewModel.onPressedDeleteReminderButton(reminder.notificationId),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.surface,
              label: 'Remove',
              icon: Platform.isAndroid ? Icons.delete_outline_rounded : CupertinoIcons.trash,
              padding: EdgeInsets.zero,
              foregroundColor: Colors.red.shade600,
            ),
            SlidableAction(
              onPressed: (ctx) async => viewModel.onTapEditReminder(reminder),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.surface,
              label: 'Edit',
              icon: Platform.isAndroid ? Icons.edit_note_rounded : CupertinoIcons.pencil_circle,
              padding: EdgeInsets.zero,
            ),
          ],
        ),

        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(color: context.colors.onSurface.withOpacity(.05), borderRadius: context.radius8),
          padding: context.paddingLowHorizontal + context.paddingLowVertical * 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reminder.notificationTitle,
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              const SizedBox(height: 2),
              Text(
                reminder.notificationBody,
                style: context.textTheme.titleSmall?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: Row(
                  children: (List<int>.from(reminder.notificationDaysInWeek, growable: false)..sort())
                      .map(
                        (e) => Container(
                          margin: context.paddingLowRight * .5,
                          padding: context.paddingLow * .5,
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
                            'weekdays.${e + 1}wd'.tr(),
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
              ),
              if (reminder.notificationEqualSchedule != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: 'Start from ',
                          children: [
                            TextSpan(
                              text: reminder.notificationEqualSchedule!.notificationStartTime?.format(context),
                              style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                            ),
                            const TextSpan(
                              text: '\rto\r',
                            ),
                            TextSpan(
                              text: reminder.notificationEqualSchedule!.notificationEndTime?.format(context),
                              style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
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
                ),
              ] else if (reminder.notificationCustomIntervalSchedule != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: 'Hours:\r\r',
                          children: reminder.notificationCustomIntervalSchedule!.notificationSchedules
                              .map(
                                (e) => TextSpan(
                                  text: "${e.format(context)}${reminder.notificationCustomIntervalSchedule!.notificationSchedules.last == e ? '' : ', '}",
                                  style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
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
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
