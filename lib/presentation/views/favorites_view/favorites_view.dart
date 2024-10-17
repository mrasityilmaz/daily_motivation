import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/core_widgets/slivers/bottom_safe_widget.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/favorites_view/favorites_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';
part 'widgets/quote_row_widget.dart';

@immutable
@RoutePage(name: 'FavoritesViewRoute')
final class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: FavoritesViewModel.new,
      builder: (context, model, child) {
        return const Stack(
          children: [
            Scaffold(
              appBar: _FavoritesAppBar(),
              body: _FavoritesViewBodyWidget(),
            ),
            ViewModelLoadingIndicator<FavoritesViewModel>(),
          ],
        );
      },
    );
  }
}
