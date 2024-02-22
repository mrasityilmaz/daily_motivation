import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quotely/core/constants/premium_constants/reminder_contants_mixin.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/navigator/app_navigator.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:stacked/stacked.dart';

part 'reminders_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/reminder_row_widget.dart';

@immutable
@RoutePage(name: 'RemindersViewRoute')
final class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: _RemindersViewModel.new,
      builder: (context, model, child) {
        return const Stack(
          children: [
            Scaffold(
              appBar: _AppBarWidget(),
              body: _RemindersViewBodyWidget(),
            ),
            ViewModelLoadingIndicator<_RemindersViewModel>(),
          ],
        );
      },
    );
  }
}

@immutable
final class _RemindersViewBodyWidget extends ViewModelWidget<_RemindersViewModel> {
  const _RemindersViewBodyWidget();

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: viewModel.reminderList.length,
            itemBuilder: (context, index) {
              final reminder = viewModel.reminderList[index];
              return _ReminderRowWidget(reminder: reminder);
            },
          ),
        ),
        SliverSafeArea(
          minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
          sliver: const SliverToBoxAdapter(
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
