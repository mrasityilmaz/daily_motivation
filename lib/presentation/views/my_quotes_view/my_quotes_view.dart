import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_size_widget.dart';
import 'package:quotely/presentation/dialogs/dialog_helper.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/presentation/views/my_quotes_view/my_quotes_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'mixins/ui_logic_mixin.dart';
part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/quote_row_widget.dart';

@immutable
@RoutePage(name: 'MyQuotesViewRoute')
final class MyQuotesView extends StatelessWidget {
  const MyQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: MyQuotesViewModel.new,
      builder: (context, model, child) {
        return const Stack(
          children: [
            Scaffold(
              appBar: _MyQuotesAppBar(),
              body: _MyQuotesViewBodyWidget(),
            ),
            ViewModelLoadingIndicator<MyQuotesViewModel>(),
          ],
        );
      },
    );
  }
}
