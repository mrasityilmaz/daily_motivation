import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/constants/enums/reminder_schedule_enum.dart';
import 'package:quotely/core/extensions/categories_extension.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/basic/choose_circle_icon.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/quote_notifications_view/viewmodel/quote_notifications_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/custom_interval_section.dart';
part 'widgets/equal_interval_section.dart';
part 'widgets/notification_categories_section.dart';

@immutable
@RoutePage(name: 'QuoteNotificationsViewRoute')
final class QuoteNotificationsView extends StatelessWidget {
  const QuoteNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: QuoteNotificationViewModel.new,
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.surface,
                title: Text(
                  'Quote Notification',
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: const _QuoteNotificationViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<QuoteNotificationViewModel>(),
          ],
        );
      },
    );
  }
}

@immutable
final class _QuoteNotificationViewBodyWidget extends ViewModelWidget<QuoteNotificationViewModel> {
  const _QuoteNotificationViewBodyWidget();

  @override
  Widget build(BuildContext context, QuoteNotificationViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const PaddingConstants.screenPaddingVertical(),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  const _NotificationcategoriesSection(),
                  SizedBox(
                    height: context.normalValue,
                  ),
                  Padding(
                    padding: const PaddingConstants.screenPaddingHorizontal(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notification Schedule',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
                        ),
                        Row(
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
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(12),
                                    //   side: BorderSide(
                                    //     color: isSelected
                                    //         ? context.colors.primary
                                    //         : context.colors.primary.withOpacity(.5),
                                    //   ),
                                    // ),
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
                        ),
                        SizedBox(
                          height: context.lowValue,
                        ),
                        CustomButton(
                          backgroundColor: context.colors.primary.withOpacity(.1),
                          padding: const PaddingConstants.lowVertical() * 1.5 + const PaddingConstants.lowHorizontal(),
                          child: Row(
                            children: [
                              ChooseCircleIcon(
                                isSelected: viewModel.selectedScheduleType == ReminderScheduleEnum.equalInterval,
                              ),
                              SizedBox(
                                width: context.lowValue,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Equal Interval',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: .8,
                                            child: Text(
                                              'Başlangıç ve bitiş saatlari arasında seçilen aralıkta bildirim gönderilir',
                                              style: context.textTheme.labelMedium
                                                  ?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
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
                            viewModel.setSelectedScheduleType(ReminderScheduleEnum.equalInterval);
                            // showTimePicker(context: context, initialTime: TimeOfDay.now(),).then((value) {});
                          },
                        ),
                        const _EqualIntervalSection(),
                        SizedBox(
                          height: context.lowValue,
                        ),
                        CustomButton(
                          backgroundColor: context.colors.primary.withOpacity(.1),
                          padding: const PaddingConstants.lowVertical() * 1.5 + const PaddingConstants.lowHorizontal(),
                          child: Row(
                            children: [
                              ChooseCircleIcon(
                                isSelected: viewModel.selectedScheduleType == ReminderScheduleEnum.customInterval,
                              ),
                              SizedBox(
                                width: context.lowValue,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Custom Times',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: .8,
                                            child: Text(
                                              'İstenilen saatlerde bildirim gönderilir',
                                              style: context.textTheme.labelMedium
                                                  ?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
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
                            viewModel.setSelectedScheduleType(ReminderScheduleEnum.customInterval);
                          },
                        ),
                        const _CustomIntervalSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverSafeArea(
          minimum: context.mediaQuery.viewPadding.bottom == 0
              ? EdgeInsets.zero
              : PaddingConstants.adaptiveScreenPaddingBottom(context),
          top: false,
          bottom: context.mediaQuery.viewPadding.bottom > 0,
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.normalTop(),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.text(
                      text: 'Save',
                      textStyle: context.textTheme.titleMedium,
                      onPressed: () async => viewModel.save(),
                      expand: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
