import 'dart:io';

import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/core/constants/category_group_enum.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/services/category_service/quote_and_category_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/slivers/mutli_sliver_grid.dart';
import 'package:daily_motivation/presentation/dialogs/app_dialogs.dart';
import 'package:daily_motivation/presentation/dialogs/dialog_bodies/show_or_pay_dialog_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

part 'categories_bottom_sheet_viewmodel.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/categories_section.dart';
part 'widgets/category_card_widget.dart';

@immutable
final class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_CategoriesBottomSheetViewModel>.nonReactive(
      viewModelBuilder: _CategoriesBottomSheetViewModel.new,
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) => ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Scaffold(
                  backgroundColor: context.colors.surface,
                  appBar: const _CategoriesBottomSheetAppBar(),
                  body: _BodyWidget(scrollController: scrollController),
                ),
                const ViewModelLoadingIndicator<_CategoriesBottomSheetViewModel>(),
              ],
            ),
          ),
        );
      },
    );
  }
}
