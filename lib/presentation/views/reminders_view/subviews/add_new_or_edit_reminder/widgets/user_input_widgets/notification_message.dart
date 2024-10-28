part of '../../add_new_or_edit_reminder_view.dart';

@immutable
final class _NotificationMessageSection extends ViewModelWidget<AddNewOrEditReminderViewModel> {
  const _NotificationMessageSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, AddNewOrEditReminderViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Message',
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
              'This shows up under the notification title',
              maxLines: 2,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.colors.onSurface.withOpacity(.4), fontStyle: FontStyle.italic),
            ),
          ],
        ),
        SizedBox(
          height: context.lowValue,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: context.height * .15),
          child: CustomTextFormFieldWidget(
            controller: viewModel.messageTextController,
            verticalTextAlign: TextAlignVertical.top,
            hintText: 'Message',
            maxLines: null,
            expands: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty || p0.trim().isEmpty || p0.replaceAll(' ', '').isEmpty) {
                return 'Message cannot be empty';
              } else if (p0.length < 3) {
                return 'Message cannot be smaller than 3 characters';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
