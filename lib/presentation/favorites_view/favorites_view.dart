import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/boxes/liked_quote_service.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';

part 'favorites_viewmodel.dart';
part 'widgets/quote_row_widget.dart';

@immutable
@RoutePage(name: 'FavoritesViewRoute')
final class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: _FavoritesViewModel.new,
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.surface,
                title: Text(
                  'Favorites',
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: const _FavoritesViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<_FavoritesViewModel>(),
          ],
        );
      },
    );
  }
}

@immutable
final class _FavoritesViewBodyWidget extends ViewModelWidget<_FavoritesViewModel> {
  const _FavoritesViewBodyWidget();

  @override
  Widget build(BuildContext context, _FavoritesViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: context.screenPadding,
          sliver: SliverList.builder(
            itemCount: viewModel.likedQuoteList.length,
            itemBuilder: (context, index) {
              final quote = viewModel.likedQuoteList[index];
              return _QuoteRowWidget(quote: quote);
            },
          ),
        ),
        SliverSafeArea(
          minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
          sliver: const SliverToBoxAdapter(
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
