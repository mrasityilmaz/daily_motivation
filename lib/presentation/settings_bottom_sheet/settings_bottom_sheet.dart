import 'dart:io';

import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

part 'settings_bottom_sheet_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';

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
          builder: (context, scrollController) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: context.colors.surface,
                  appBar: const _SettingsBottomSheetAppBar(),
                  body: _BodyWidget(scrollController: scrollController),
                ),
                const ViewModelLoadingIndicator<_SettingsBottomSheetViewModel>(),
              ],
            ),
          ),
        );
      },
    );
  }
}
