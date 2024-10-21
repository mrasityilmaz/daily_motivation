// ignore_for_file: deprecated_member_use

part of '../quote_notification_view.dart';

@immutable
final class _EqualIntervalSection extends SelectorViewModelWidget<_QuoteNotificationViewModel, ReminderScheduleEnum?> {
  const _EqualIntervalSection();

  @override
  Widget build(BuildContext context, ReminderScheduleEnum? selectedScheduleType) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: const SizedBox(),
      secondChild: const Padding(
        padding: PaddingConstants.normalVertical(),
        child: Column(
          children: [
            __TimeRangeRow(),
            __StartAndEndTimePickerRowWidget(),
          ],
        ),
      ),
      crossFadeState: selectedScheduleType == ReminderScheduleEnum.equalInterval
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
    );
  }

  @override
  ReminderScheduleEnum? selector(_QuoteNotificationViewModel viewModel) {
    return viewModel.selectedScheduleType;
  }
}

@immutable
final class __TimeRangeRow extends ViewModelWidget<_QuoteNotificationViewModel> {
  const __TimeRangeRow();

  @override
  Widget build(BuildContext context, _QuoteNotificationViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.normalBottom() + const PaddingConstants.lowTop(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton.text(
                  text: viewModel.equalIntervalValue.start.format(context),
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () async {
                    await AppDialogs.instance
                        .showAdaptiveTimePicker(context, initialTime: viewModel.equalIntervalValue.start)
                        .then((value) {
                      if (value != null) {
                        viewModel.setEqualIntervalStartValue(start: value);
                      }
                    });
                  },
                ),
                Padding(
                  padding: const PaddingConstants.lowLeft() * .5,
                  child: Text(
                    'Start at',
                    style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.75)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const PaddingConstants.lowHorizontal() + const PaddingConstants.lowBottom() * 1.5,
            child: Text(
              ':',
              style: context.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.5)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton.text(
                  text: viewModel.equalIntervalValue.end.format(context),
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () async {
                    await AppDialogs.instance
                        .showAdaptiveTimePicker(context, initialTime: viewModel.equalIntervalValue.end)
                        .then((value) {
                      if (value != null) {
                        viewModel.setEqualIntervalEndValue(end: value);
                      }
                    });
                  },
                ),
                Padding(
                  padding: const PaddingConstants.lowLeft() * .5,
                  child: Text(
                    'End to',
                    style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.75)),
                  ),
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
final class __StartAndEndTimePickerRowWidget extends ViewModelWidget<_QuoteNotificationViewModel> {
  const __StartAndEndTimePickerRowWidget();

  @override
  Widget build(BuildContext context, _QuoteNotificationViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: viewModel.equalIntervalKeyList.map((e) {
                final bool isSelected = viewModel.equalIntervalValue.interval == e.$1 + 1;
                return Padding(
                  key: e.$2,
                  padding: const PaddingConstants.lowLeft(),
                  child: CustomButton.outlinedText(
                    text: 'x${e.$1 + 1}',
                    textStyle: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                    backgroundColor: isSelected ? context.colors.primary : context.colors.background,
                    textColor: !isSelected ? context.colors.primary : context.colors.background,
                    onPressed: () {
                      viewModel.setEqualIntervalIntervalValue(interval: e.$1 + 1, context: e.$2.currentContext);
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
