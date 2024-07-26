import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/reminder_schedule_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/data/services/hive_service/boxes/reminder_service.dart';
import 'package:quotely/data/services/hive_service/hive_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/basic/choose_circle_icon.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/textfield/textfield_widget.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

part 'add_new_or_edit_reminder_viewmodel.dart';
part 'mixins/custom_interval_calculator_mixin.dart';
part 'mixins/equal_interval_calculator_mixin.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/custom_interval_section.dart';
part 'widgets/equal_interval_section.dart';

@immutable
@RoutePage<ReminderModel>(name: 'AddNewOrEditReminderViewRoute')
final class AddNewOrEditReminderView<T> extends StatelessWidget {
  const AddNewOrEditReminderView({super.key, this.reminder});
  final ReminderModel? reminder;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => _AddNewOrEditReminderViewModel(editReminderModel: reminder),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: _AppBarWidget(reminder: reminder),
              body: const _AddNewOrEditReminderViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<_AddNewOrEditReminderViewModel>(),
          ],
        );
      },
    );
  }
}
