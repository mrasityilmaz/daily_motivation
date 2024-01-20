part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class _EqualIntervalSection extends SelectorViewModelWidget<_AddNewOrEditReminderViewModel, int> {
  const _EqualIntervalSection();

  @override
  Widget build(BuildContext context, int selectedScheduleIndex) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: const SizedBox(),
      secondChild: Padding(
        padding: context.paddingNormalVertical,
        child: const Column(
          children: [
            __TimeRangeRow(),
            __StartAndEndTimePickerRowWidget(),
          ],
        ),
      ),
      crossFadeState: selectedScheduleIndex == 0 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }

  @override
  int selector(_AddNewOrEditReminderViewModel viewModel) {
    return viewModel.selectedScheduleIndex;
  }
}

@immutable
final class __TimeRangeRow extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const __TimeRangeRow();

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return Padding(
      padding: context.paddingNormalBottom + context.paddingLowTop,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdvancedButtonWidget.text(
                  text: viewModel.equalIntervalValue.start?.format(context) ?? '09:00',
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () async {
                    await AppDialogs.instance.showAdaptiveTimePicker(context, initialTime: TimeOfDay.now()).then((value) {
                      if (value != null) {
                        viewModel.setEqualIntervalStartValue(start: value);
                      }
                    });
                  },
                ),
                Padding(
                  padding: context.paddingLowLeft * .5,
                  child: Text('Start at', style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.75))),
                ),
              ],
            ),
          ),
          Padding(
            padding: context.paddingLowHorizontal + context.paddingLowBottom * 1.5,
            child: Text(
              ':',
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.5)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdvancedButtonWidget.text(
                  text: viewModel.equalIntervalValue.end?.format(context) ?? '22:00',
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () async {
                    await AppDialogs.instance.showAdaptiveTimePicker(context, initialTime: TimeOfDay.now()).then((value) {
                      if (value != null) {
                        viewModel.setEqualIntervalStartValue(start: value);
                      }
                    });
                  },
                ),
                Padding(
                  padding: context.paddingLowLeft * .5,
                  child: Text('End to', style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.75))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
final class __StartAndEndTimePickerRowWidget extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const __StartAndEndTimePickerRowWidget();

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(24, (index) {
                final bool isSelected = viewModel.equalIntervalValue.interval == index + 1;
                return Padding(
                  padding: context.paddingLowLeft,
                  child: AdvancedButtonWidget.text(
                    text: 'x${index + 1}',
                    textStyle: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                    backgroundColor: isSelected ? context.colors.primary : context.colors.background,
                    textColor: !isSelected ? context.colors.primary : context.colors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.radius8,
                      side: BorderSide(
                        color: context.colors.primary,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      viewModel.setEqualIntervalIntervalValue(interval: index + 1);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
