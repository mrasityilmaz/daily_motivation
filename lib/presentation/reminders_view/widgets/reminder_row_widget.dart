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
              onPressed: (ctx) async => {},
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.background,
              label: 'Remove',
              icon: Platform.isAndroid ? Icons.delete_outline_rounded : CupertinoIcons.trash,
              padding: EdgeInsets.zero,
              foregroundColor: Colors.red.shade600,
            ),
            SlidableAction(
              onPressed: (ctx) async => {},
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.background,
              label: 'Edit',
              icon: Platform.isAndroid ? Icons.edit_note_rounded : CupertinoIcons.pencil_circle,
              padding: EdgeInsets.zero,
            ),
          ],
        ),

        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(color: context.colors.onBackground.withOpacity(.05), borderRadius: context.radius8),
          padding: context.paddingLowHorizontal + context.paddingLowVertical * 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reminder.notificationTitle,
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                reminder.notificationBody,
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                reminder.notificationDaysInWeek.join(', '),
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                reminder.notificationEqualSchedule?.notificationSchedules.join(', ') ?? reminder.notificationCustomIntervalSchedule?.notificationSchedules.join(', ') ?? '',
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              Text(
                reminder.toJson().entries.map((e) {
                  if (e.value is List) {
                    return '${e.key}: ${e.value.join(', ')}';
                  }
                  if (e.value is Map) {
                    return '${e.key}: ${e.value.entries.map((e) => '${e.key}: ${e.value}').join(', ')}';
                  }
                  if (e.value is ReminderNotificationEqualScheduleModel) {
                    return '${e.key}: ${e.value.toJson().entries.map((e) => '${e.key}: ${e.value}').join(', ')}';
                  }
                  if (e.value is ReminderNotificationScheduleCustomIntervalModel) {
                    return '${e.key}: ${e.value.toJson().entries.map((e) => '${e.key}: ${e.value}').join(', ')}';
                  }

                  return '${e.key}: ${e.value}';
                }).join('\n'),
                maxLines: 20,
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
