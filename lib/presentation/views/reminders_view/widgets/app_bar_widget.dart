part of '../reminders_view.dart';

@immutable
final class _AppBarWidget extends SelectorViewModelWidget<_RemindersViewModel, bool> implements PreferredSizeWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context, bool hasReachedMaxReminderCount) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        LocaleKeys.reminders_reminders.tr(),
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        if (!hasReachedMaxReminderCount) ...[
          const _AddNewReminderButton(),
        ],
      ],
    );
  }

  @override
  bool selector(_RemindersViewModel viewModel) {
    return viewModel.hasReachedMaxReminderCount;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable
final class _AddNewReminderButton extends ViewModelWidget<_RemindersViewModel> {
  const _AddNewReminderButton() : super(reactive: false);

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.screenPaddingRight() * .5,
      child: CustomButton.outlined(
        backgroundColor: context.colors.surface,
        onPressed: viewModel.onTapAddNewReminder,
        child: Badge(
          label: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.surface,
            ),
            child: Icon(
              CupertinoIcons.add_circled_solid,
              size: 14,
              color: context.colors.primary,
            ),
          ),
          offset: const Offset(4, -1.5),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Icon(
            Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
