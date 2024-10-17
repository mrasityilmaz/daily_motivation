import 'dart:io';

import 'package:auto_route/auto_route.dart' as auto_route;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/notification_service/notification_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:stacked/stacked.dart';

part 'settings_bottom_sheet_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/preferences_and_favorites_section.dart';
part 'widgets/settings_row_widget.dart';
part 'widgets/settings_section.dart';

@immutable
final class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_SettingsBottomSheetViewModel>.nonReactive(
      viewModelBuilder: _SettingsBottomSheetViewModel.new,
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: .8,
          builder: (context, scrollController) => PrimaryScrollController(
            controller: scrollController,
            child: ClipRRect(
              borderRadius: context.radius16,
              child: const Stack(
                children: [
                  Scaffold(
                    appBar: _SettingsBottomSheetAppBar(),
                    body: _BodyWidget(),
                  ),
                  ViewModelLoadingIndicator<_SettingsBottomSheetViewModel>(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
