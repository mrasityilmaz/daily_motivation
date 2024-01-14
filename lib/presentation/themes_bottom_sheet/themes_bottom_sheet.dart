import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_motivation/core/constants/default_fonts_enum.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:daily_motivation/presentation/dialogs/app_dialogs.dart';
import 'package:daily_motivation/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:daily_motivation/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:stacked/stacked.dart';

part 'themes_bottom_sheet_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/theme_image_box_widget.dart';

@immutable
final class ThemesBottomSheet extends StatelessWidget {
  const ThemesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_ThemesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: _ThemesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: context.colors.surface,
                  appBar: const _ThemesBottomSheetAppBar(),
                  body: _BodyWidget(scrollController: scrollController),
                ),
                const ViewModelLoadingIndicator<_ThemesBottomSheetViewModel>(),
              ],
            ),
          ),
        );
      },
    );
  }
}
