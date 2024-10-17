part of '../../add_new_or_edit_reminder_view.dart';

@immutable
final class __ScheduleModeSelectButton extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const __ScheduleModeSelectButton({required this.type, required this.title, required this.subTitle});

  final ReminderScheduleEnum type;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return AdvancedButtonWidget(
      backgroundColor: context.colors.primary.withOpacity(.1),
      padding: const PaddingConstants.lowVertical() * 1.5 + const PaddingConstants.lowHorizontal(),
      child: Row(
        children: [
          ChooseCircleIcon(isSelected: viewModel.selectedScheduleType == type),
          SizedBox(
            width: context.lowValue,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: .8,
                        child: Text(
                          subTitle,
                          style:
                              context.textTheme.labelMedium?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      onPressed: () {
        viewModel.setSelectedScheduleType(type);
      },
    );
  }
}
