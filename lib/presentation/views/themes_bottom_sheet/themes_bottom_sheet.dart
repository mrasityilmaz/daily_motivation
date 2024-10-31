import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/constants/enums/default_fonts_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/components/viewmodel_builder.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_size_widget.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/themes_bottom_sheet/themes_bottom_sheet_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'mixins/image_box_ui_logic_mixin.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/grid_builder.dart';
part 'widgets/image_box_widget/text_in_box_widget.dart';
part 'widgets/image_box_widget/theme_image_box_widget.dart';

@immutable
final class ThemesBottomSheet extends StatelessSheetableWidget {
  const ThemesBottomSheet({super.key}) : super(primary: false);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: ThemesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return const ViewModelBodyBuilder<ThemesBottomSheetViewModel>(
          body: _BodyWidget(),
        );
      },
    );
  }

  @override
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets(
      child: this,
    ).showBottomSheet(
      context,
    );
  }
}
