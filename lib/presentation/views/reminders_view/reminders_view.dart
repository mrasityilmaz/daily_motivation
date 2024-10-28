import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/constants/enums/weekday_enum/weekday_enum.dart';
import 'package:quotely/core/constants/premium_constants/reminder_contants_mixin.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/premium_services/premium_services.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_size_widget.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';
import 'package:stacked/stacked.dart';

part 'reminders_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/reminder_list.dart';
part 'widgets/reminder_list_widget.dart';

///
/// Todo - Feature: Reminders
///
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
              body: _ReminderListWidget(),
            ),
            ViewModelLoadingIndicator<_RemindersViewModel>(),
          ],
        );
      },
    );
  }
}
