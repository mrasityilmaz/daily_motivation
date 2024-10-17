part of '../reminders_view.dart';

@immutable
final class _RemindersViewBodyWidget extends SelectorViewModelWidget<_RemindersViewModel, List<ReminderModel>> {
  const _RemindersViewBodyWidget();

  @override
  Widget build(BuildContext context, List<ReminderModel> reminderList) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const PaddingConstants.screenPadding(),
          sliver: SliverList.builder(
            itemCount: reminderList.length,
            itemBuilder: (context, index) {
              final reminder = reminderList[index];
              return _ReminderRowWidget(reminder: reminder);
            },
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }

  @override
  List<ReminderModel> selector(_RemindersViewModel viewModel) {
    return viewModel.reminderList;
  }
}
