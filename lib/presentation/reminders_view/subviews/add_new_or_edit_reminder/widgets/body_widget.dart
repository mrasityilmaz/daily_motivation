part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class _AddNewOrEditReminderViewBodyWidget extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const _AddNewOrEditReminderViewBodyWidget();

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: context.screenPadding,
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Notification Icon',
                  //       style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                  //     ),
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.info_outlined,
                  //           color: context.colors.onBackground.withOpacity(.4),
                  //           size: 16,
                  //         ),
                  //         const SizedBox(width: 4),
                  //         AutoSizeText(
                  //           'Icon is optional\nIf not provided, it will be set to default',
                  //           maxLines: 2,
                  //           style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: context.lowValue,
                  //     ),
                  //     SizedBox(
                  //       height: context.width * .2,
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             height: context.width * .2,
                  //             width: context.width * .2,
                  //             decoration: BoxDecoration(
                  //               color: context.appColors.surfaceColor.withOpacity(.2),
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //             child: FractionallySizedBox(
                  //               heightFactor: .45,
                  //               widthFactor: .45,
                  //               child: FittedBox(
                  //                 child: Icon(
                  //                   Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: context.lowValue,
                  //           ),
                  //           Expanded(
                  //             child: SizedBox(
                  //               height: context.width * .2,
                  //               child: ListView.builder(
                  //                 itemCount: Colors.primaries.length,
                  //                 scrollDirection: Axis.horizontal,
                  //                 itemBuilder: (context, index) {
                  //                   return Container(
                  //                     margin: context.paddingLowLeft,
                  //                     height: context.width * .2,
                  //                     width: context.width * .2,
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.primaries[index].withOpacity(.2),
                  //                       borderRadius: BorderRadius.circular(8),
                  //                     ),
                  //                     child: FractionallySizedBox(
                  //                       heightFactor: .45,
                  //                       widthFactor: .45,
                  //                       child: FittedBox(
                  //                         child: Icon(
                  //                           Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: context.normalValue,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Title',
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.info_outlined,
                            color: context.colors.onSurface.withOpacity(.4),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          AutoSizeText(
                            'This shows up in the notification',
                            maxLines: 2,
                            style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurface.withOpacity(.4), fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.lowValue,
                      ),
                      CustomTextFieldWidget(
                        controller: viewModel.titleTextController,
                        hintText: 'Title',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.normalValue,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Message',
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.info_outlined,
                            color: context.colors.onSurface.withOpacity(.4),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          AutoSizeText(
                            'This shows up under the notification title',
                            maxLines: 2,
                            style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurface.withOpacity(.4), fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.lowValue,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: context.height * .15),
                        child: CustomTextFormFieldWidget(
                          controller: viewModel.messageTextController,
                          verticalTextAlign: TextAlignVertical.top,
                          hintText: 'Message',
                          maxLines: null,
                          expands: true,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty || p0.trim().isEmpty || p0.replaceAll(' ', '').isEmpty) {
                              return 'Message cannot be empty';
                            } else if (p0.length < 3) {
                              return 'Message cannot be smaller than 3 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.normalValue,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Schedule',
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
                      ),
                      Row(
                        children: List.generate(7, (index) => index).map(
                          (e) {
                            final bool isSelected = viewModel.isDaysOfWeekSelected(e);
                            return Expanded(
                              child: Padding(
                                padding: context.paddingLowVertical + (e != 0 ? context.paddingLowLeft * .5 : EdgeInsets.zero),
                                child: AdvancedButtonWidget(
                                  expand: true,
                                  backgroundColor: isSelected ? context.colors.primary : context.colors.surface,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: isSelected ? context.colors.primary : context.colors.primary.withOpacity(.5),
                                    ),
                                  ),
                                  onPressed: () {
                                    viewModel.addOrRemoveSelectedDaysOfWeekIndex(e);
                                  },
                                  padding: context.paddingLow * .1,
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
                      AdvancedButtonWidget(
                        backgroundColor: context.colors.primary.withOpacity(.1),
                        padding: context.paddingLowVertical * 1.5 + context.paddingLowHorizontal,
                        child: Row(
                          children: [
                            ChooseCircleIcon(isSelected: viewModel.selectedScheduleType == ReminderScheduleEnum.equalInterval),
                            SizedBox(
                              width: context.lowValue,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Equal Interval',
                                    style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: .8,
                                          child: Text(
                                            'Başlangıç ve bitiş saatlari arasında seçilen aralıkta bildirim gönderilir',
                                            style: context.textTheme.labelMedium?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
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
                      AdvancedButtonWidget(
                        backgroundColor: context.colors.primary.withOpacity(.1),
                        padding: context.paddingLowVertical * 1.5 + context.paddingLowHorizontal,
                        child: Row(
                          children: [
                            ChooseCircleIcon(isSelected: viewModel.selectedScheduleType == ReminderScheduleEnum.customInterval),
                            SizedBox(
                              width: context.lowValue,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Custom Times',
                                    style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.75)),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: .8,
                                          child: Text(
                                            'İstenilen saatlerde bildirim gönderilir',
                                            style: context.textTheme.labelMedium?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
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
                ],
              ),
            ),
          ),
        ),
        SliverSafeArea(
          minimum: context.mediaQuery.viewPadding.bottom == 0 ? EdgeInsets.zero : context.adaptiveScreenPaddingBottom,
          top: false,
          bottom: context.mediaQuery.viewPadding.bottom > 0,
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: context.screenPaddingHorizontal + context.paddingNormalTop,
              child: Row(
                children: [
                  Expanded(
                    child: AdvancedButtonWidget.text(
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
