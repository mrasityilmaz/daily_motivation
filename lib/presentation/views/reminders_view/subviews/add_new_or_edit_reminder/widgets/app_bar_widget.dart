part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class _AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWidget({required this.reminder});

  final ReminderModel? reminder;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        reminder != null ? 'Edit Reminder' : 'New Reminder',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
