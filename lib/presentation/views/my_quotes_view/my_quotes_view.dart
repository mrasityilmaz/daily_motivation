import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/views/my_quotes_view/my_quotes_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
