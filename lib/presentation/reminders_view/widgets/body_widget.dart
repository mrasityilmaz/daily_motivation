part of '../reminders_view.dart';

@immutable
final class _RemindersViewBodyWidget extends ViewModelWidget<_RemindersViewModel> {
  const _RemindersViewBodyWidget();

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: viewModel.reminderList.length,
            itemBuilder: (context, index) {
              final reminder = viewModel.reminderList[index];
              return _ReminderRowWidget(reminder: reminder);
            },
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }
}
