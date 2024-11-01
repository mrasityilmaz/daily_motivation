import 'dart:io';

import 'package:auto_route/auto_route.dart' as auto_route;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/core/services/notification_service/notification_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/components/viewmodel_builder.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/upgrade_premium.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';
import 'package:stacked/stacked.dart';

part 'settings_viewmodel.dart';
part 'widgets/body_widget.dart';
part 'widgets/preferences_and_favorites_section.dart';
part 'widgets/settings_row_widget.dart';
part 'widgets/settings_section.dart';

@immutable
final class SettingsBottomSheet extends StatelessSheetableWidget {
  const SettingsBottomSheet({super.key}) : super(primary: false);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsBottomSheetViewModel>.nonReactive(
      viewModelBuilder: SettingsBottomSheetViewModel.new,
      builder: (context, viewModel, child) {
        return const ViewModelBodyBuilder<SettingsBottomSheetViewModel>(
          body: _BodyWidget(),
        );
      },
    );
  }

  @override
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets(
      child: this,
      showDragHandle: true,
    ).showBottomSheet(
      context,
    );
  }
}
