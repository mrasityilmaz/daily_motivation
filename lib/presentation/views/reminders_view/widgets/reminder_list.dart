part of '../reminders_view.dart';

@immutable
final class _ReminderListWidget extends SelectorViewModelWidget<_RemindersViewModel, List<ReminderModel>> {
  const _ReminderListWidget();

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
              return _ReminderListItemWidget(reminder: reminder);
            },
          ),
        ),
        const SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }

  @override
  List<ReminderModel> selector(_RemindersViewModel viewModel) {
    return viewModel.reminderList;
  }
}
