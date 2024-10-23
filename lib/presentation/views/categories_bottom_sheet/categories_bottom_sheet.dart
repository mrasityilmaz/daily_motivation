import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/constants/enums/category_group_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/vselector_with_viewmodel_widget.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_button/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/mutli_sliver_grid.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/presentation/views/categories_bottom_sheet/categories_bottom_sheet_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/categories_section.dart';
part 'widgets/category_card_widget.dart';

@immutable
final class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: CategoriesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return const ClipRRect(
          borderRadius: RadiusConstants.highTop(),
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                // backgroundColor: context.colors.surface,
                appBar: _CategoriesBottomSheetAppBar(),
                body: _BodyWidget(),
              ),
              ViewModelLoadingIndicator<CategoriesBottomSheetViewModel>(),
            ],
          ),
        );
      },
    );
  }
}
