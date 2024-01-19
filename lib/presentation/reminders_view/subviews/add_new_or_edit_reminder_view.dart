import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/textfield/textfield_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

part 'add_new_or_edit_reminder_viewmodel.dart';

@immutable
@RoutePage(name: 'AddNewOrEditReminderViewRoute')
final class AddNewOrEditReminderView<T extends QuoteHiveModel?> extends StatelessWidget {
  const AddNewOrEditReminderView({super.key, this.editQuote});
  final QuoteHiveModel? editQuote;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: _AddNewOrEditReminderViewModel.new,
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.surface,
                title: Text(
                  editQuote != null ? 'Edit Reminder' : 'New Reminder',
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: const _AddNewOrEditReminderViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<_AddNewOrEditReminderViewModel>(),
          ],
        );
      },
    );
  }
}

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
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notification Icon',
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outlined,
                          color: context.colors.onBackground.withOpacity(.4),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        AutoSizeText(
                          'Icon is optional\nIf not provided, it will be set to default',
                          maxLines: 2,
                          style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    SizedBox(
                      height: context.width * .2,
                      child: Row(
                        children: [
                          Container(
                            height: context.width * .2,
                            width: context.width * .2,
                            decoration: BoxDecoration(
                              color: context.appColors.surfaceColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FractionallySizedBox(
                              heightFactor: .45,
                              widthFactor: .45,
                              child: FittedBox(
                                child: Icon(
                                  Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.lowValue,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: context.width * .2,
                              child: ListView.builder(
                                itemCount: Colors.primaries.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: context.paddingLowLeft,
                                    height: context.width * .2,
                                    width: context.width * .2,
                                    decoration: BoxDecoration(
                                      color: Colors.primaries[index].withOpacity(.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FractionallySizedBox(
                                      heightFactor: .45,
                                      widthFactor: .45,
                                      child: FittedBox(
                                        child: Icon(
                                          Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
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
                      'Notification Title',
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outlined,
                          color: context.colors.onBackground.withOpacity(.4),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        AutoSizeText(
                          'This shows up in the notification',
                          maxLines: 2,
                          style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    CustomTextFieldWidget(
                      controller: viewModel.quoteTextController,
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
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outlined,
                          color: context.colors.onBackground.withOpacity(.4),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        AutoSizeText(
                          'This shows up under the notification title',
                          maxLines: 2,
                          style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: context.height * .15),
                      child: CustomTextFormFieldWidget(
                        controller: viewModel.authorTextController,
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
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    AdvancedButtonWidget(
                      backgroundColor: context.colors.primary.withOpacity(.1),
                      padding: context.paddingLowVertical * 1.5 + context.paddingLowHorizontal,
                      child: Row(
                        children: [
                          _ChooseCircleIcon(viewModel.selectedScheduleIndex == 0),
                          SizedBox(
                            width: context.lowValue,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Equal Interval',
                                  style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onBackground.withOpacity(.75)),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: .8,
                                        child: Text(
                                          'Başlangıç ve bitiş saatlari arasında seçilen aralıkta bildirim gönderilir',
                                          style: context.textTheme.labelMedium?.copyWith(color: context.colors.onBackground.withOpacity(.5)),
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
                        viewModel.setSelectedScheduleIndex(0);
                        // showTimePicker(context: context, initialTime: TimeOfDay.now(),).then((value) {});
                      },
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: const SizedBox(),
                      secondChild: Padding(
                        padding: context.paddingNormalVertical,
                        child: Column(
                          children: [
                            const _TimeRangeRow(),
                            Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(24, (index) {
                                        return Padding(
                                          padding: context.paddingLowLeft,
                                          child: AdvancedButtonWidget.text(
                                            text: 'x${index + 1}',
                                            textStyle: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                                            backgroundColor: context.colors.background,
                                            textColor: context.colors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: context.radius8,
                                              side: BorderSide(
                                                color: context.colors.primary,
                                                width: 2,
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: viewModel.selectedScheduleIndex == 0 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    ),
                    SizedBox(
                      height: context.lowValue,
                    ),
                    AdvancedButtonWidget(
                      backgroundColor: context.colors.primary.withOpacity(.1),
                      padding: context.paddingLowVertical * 1.5 + context.paddingLowHorizontal,
                      child: Row(
                        children: [
                          _ChooseCircleIcon(viewModel.selectedScheduleIndex == 1),
                          SizedBox(
                            width: context.lowValue,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Custom Times',
                                  style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onBackground.withOpacity(.75)),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: .8,
                                        child: Text(
                                          'İstenilen saatlerde bildirim gönderilir',
                                          style: context.textTheme.labelMedium?.copyWith(color: context.colors.onBackground.withOpacity(.5)),
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
                        viewModel.setSelectedScheduleIndex(1);
                      },
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: const SizedBox(),
                      secondChild: Padding(
                        padding: context.paddingNormalVertical,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('1.', style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: AdvancedButtonWidget.text(
                                    text: '09:00',
                                    textStyle: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    textColor: context.colors.onBackground.withOpacity(.7),
                                    backgroundColor: context.colors.primary.withOpacity(.25),
                                    onPressed: () {},
                                    expand: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: viewModel.selectedScheduleIndex == 1 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    ),
                  ],
                ),
              ],
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
                      onPressed: () {},
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

class _TimeRangeRow extends StatelessWidget {
  const _TimeRangeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalBottom + context.paddingLowTop,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdvancedButtonWidget.text(
                  text: '09:00',
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return CupertinoTimerPicker(
                          backgroundColor: context.colors.background,
                          onTimerDurationChanged: print,
                          mode: CupertinoTimerPickerMode.hm,
                        );
                      },
                    );
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
                  text: '22:00',
                  expand: true,
                  textStyle: context.textTheme.titleMedium,
                  onPressed: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return CupertinoTimerPicker(
                          backgroundColor: context.colors.background,
                          onTimerDurationChanged: print,
                          mode: CupertinoTimerPickerMode.hm,
                        );
                      },
                    );
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
final class _ChooseCircleIcon extends StatelessWidget {
  const _ChooseCircleIcon(this.isSelected);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: context.colors.background,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? context.colors.primary : context.colors.primary.withOpacity(.5),
          width: 2,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : context.colors.background,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
