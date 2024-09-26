import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/enums/default_fonts_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/views/themes_bottom_sheet/themes_bottom_sheet_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'mixins/image_box_ui_logic_mixin.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/grid_builder.dart';
part 'widgets/image_box_widget/text_in_box_widget.dart';
part 'widgets/image_box_widget/theme_image_box_widget.dart';

@immutable
final class ThemesBottomSheet extends StatelessWidget {
  const ThemesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: ThemesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          minChildSize: .8,
          initialChildSize: 1,
          builder: (context, scrollController) {
            return PrimaryScrollController(
              controller: scrollController,
              child: ClipRRect(
                borderRadius: context.radius16Top,
                child: const Stack(
                  children: [
                    Scaffold(
                      appBar: _ThemesBottomSheetAppBar(),
                      body: _BodyWidget(),
                    ),
                    ViewModelLoadingIndicator<ThemesBottomSheetViewModel>(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
