part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class _CustomIntervalSection extends ViewModelWidget<AddNewOrEditReminderViewModel> {
  const _CustomIntervalSection();

  @override
  Widget build(BuildContext context, AddNewOrEditReminderViewModel viewModel) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: const SizedBox(),
      secondChild: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final TimeOfDay currentValue = viewModel.customIntervalValue[index];

              return Material(
                key: ValueKey(index),
                child: Padding(
                  padding: const PaddingConstants.lowVertical(),
                  child: Row(
                    children: [
                      SizedBox(
                        width: kMinInteractiveDimension * .75,
                        child: Center(
                          child: Text(
                            '${index + 1}.',
                            style: context.textTheme.titleSmall?.copyWith(
                              color: context.colors.onSurface.withOpacity(.75),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: kMinInteractiveDimension * .95,
                            maxHeight: kMinInteractiveDimension * .95,
                          ),
                          decoration: ShapeDecoration(
                            shape: const RoundedRectangleBorder(
                              borderRadius: RadiusConstants.allLow(),
                            ),
                            color: context.colors.onSurface.withOpacity(.05),
                          ),
                          child: Center(
                            child: Text(
                              currentValue.format(context),
                              style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          viewModel.removeCustomIntervalTimeValue(index: index);
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: const SizedBox(
                          width: kMinInteractiveDimension * .75,
                          height: kMinInteractiveDimension * .75,
                          child: Center(
                            child: Icon(CupertinoIcons.minus_circle, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: viewModel.customIntervalValue.length,
          ),
          if (viewModel.customIntervalValue.length <= 24) ...[
            Padding(
              padding: const PaddingConstants.normalTop(),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.outlinedText(
                      text: 'Add Time',
                      backgroundColor: context.colors.surface,
                      expand: true,
                      textColor: context.colors.primary,
                      onPressed: () async {
                        await DialogHelper.showAdaptiveTimePicker(context, initialTime: TimeOfDay.now()).then((value) {
                          if (value != null) {
                            viewModel.addCustomIntervalTimeValue(time: value);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          SizedBox(
            height: context.mediumValue,
          ),
        ],
      ),
      crossFadeState: viewModel.selectedScheduleType == ReminderScheduleEnum.customInterval
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
    );
  }
}
