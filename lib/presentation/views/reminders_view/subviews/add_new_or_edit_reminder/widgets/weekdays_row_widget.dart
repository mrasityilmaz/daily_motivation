part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class __WeekDaysRow extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const __WeekDaysRow();

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return Row(
      children: List.generate(7, (index) => index).map(
        (e) {
          final bool isSelected = viewModel.isDaysOfWeekSelected(e);
          return Expanded(
            child: Padding(
              padding: const PaddingConstants.lowVertical() +
                  (e != 0 ? const PaddingConstants.lowLeft() * .5 : EdgeInsets.zero),
              child: CustomButton.outlined(
                expand: true,
                backgroundColor: isSelected ? context.colors.primary : context.colors.surface,
                onPressed: () {
                  viewModel.addOrRemoveSelectedDaysOfWeekIndex(e);
                },
                padding: const PaddingConstants.allLow() * .1,
                child: AutoSizeText(
                  'weekdays.${e + 1}wd'.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? context.colors.onPrimary : context.colors.primary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  maxLines: 1,
                  maxFontSize: context.textTheme.titleMedium!.fontSize!,
                  minFontSize: context.textTheme.labelSmall!.fontSize!,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
