import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_navigator.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/constants/enums/category_group_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/mutli_sliver_grid.dart';
import 'package:quotely/presentation/dialogs/app_dialogs.dart';
import 'package:quotely/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:quotely/presentation/dialogs/progress_overlay_dialog.dart';
import 'package:quotely/presentation/overrides/vselector_with_viewmodel_widget.dart';
import 'package:quotely/presentation/views/categories_bottom_sheet/categories_bottom_sheet_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: .8,
          builder: (context, scrollController) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: context.colors.surface,
                  appBar: const _CategoriesBottomSheetAppBar(),
                  body: _BodyWidget(scrollController: scrollController),
                ),
                const ViewModelLoadingIndicator<CategoriesBottomSheetViewModel>(),
              ],
            ),
          ),
        );
      },
    );
  }
}
