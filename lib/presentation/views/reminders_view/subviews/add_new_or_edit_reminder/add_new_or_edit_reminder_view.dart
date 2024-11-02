import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/constants/enums/reminder_schedule_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/data/models/reminder_model/reminder_model.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/basic/choose_circle_icon.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/textfield/textfield_widget.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/dialogs/dialog_helper.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/presentation/views/reminders_view/subviews/add_new_or_edit_reminder/viewmodel/add_new_or_edit_reminder_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/custom_interval_section.dart';
part 'widgets/equal_interval_section.dart';
part 'widgets/user_input_widgets/notification_message.dart';
part 'widgets/user_input_widgets/notification_schedule.dart';
part 'widgets/user_input_widgets/notification_title.dart';
part 'widgets/user_input_widgets/schedule_mode_button.dart';
part 'widgets/weekdays_row_widget.dart';

@immutable
@RoutePage(name: 'AddNewOrEditReminderViewRoute')
final class AddNewOrEditReminderView<T> extends StatelessWidget {
  const AddNewOrEditReminderView({super.key, this.reminder});
  final ReminderModel? reminder;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AddNewOrEditReminderViewModel(editReminderModel: reminder),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: _AppBarWidget(reminder: reminder),
              body: const _AddNewOrEditReminderViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<AddNewOrEditReminderViewModel>(),
          ],
        );
      },
    );
  }
}
