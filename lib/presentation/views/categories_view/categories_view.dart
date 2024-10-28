import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/constants/enums/category_group_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/abstracts/vselector_with_viewmodel_widget.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_size_widget.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/categories_view/categories_viewmodel.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/categories_section.dart';
part 'widgets/category_card_widget.dart';

@immutable
final class CategoriesView extends StatelessSheetableWidget {
  const CategoriesView({super.key, super.primary = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: CategoriesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Scaffold(
              appBar: _CategoriesBottomSheetAppBar(
                primary: primary,
              ),
              body: const _BodyWidget(),
            ),
            const ViewModelLoadingIndicator<CategoriesBottomSheetViewModel>(),
          ],
        );
      },
    );
  }

  @override
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets(
      child: this,
      bounce: false,
      expand: true,
    ).showBottomSheet(
      context,
    );
  }
}
