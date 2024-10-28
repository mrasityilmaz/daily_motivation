part of '../../add_new_or_edit_reminder_view.dart';

@immutable
final class _NotificationTitleSection extends ViewModelWidget<AddNewOrEditReminderViewModel> {
  const _NotificationTitleSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, AddNewOrEditReminderViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Title',
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
        ),
        Row(
          children: [
            Icon(
              Icons.info_outlined,
              color: context.colors.onSurface.withOpacity(.4),
              size: 16,
            ),
            const SizedBox(width: 4),
            AutoSizeText(
              'This shows up in the notification',
              maxLines: 2,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.colors.onSurface.withOpacity(.4), fontStyle: FontStyle.italic),
            ),
          ],
        ),
        SizedBox(
          height: context.lowValue,
        ),
        CustomTextFieldWidget(
          controller: viewModel.titleTextController,
          hintText: 'Title',
        ),
      ],
    );
  }
}
