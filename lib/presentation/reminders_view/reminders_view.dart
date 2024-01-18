import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';

part 'reminders_viewmodel.dart';
part 'widgets/reminder_row_widget.dart';

@immutable
@RoutePage(name: 'RemindersViewRoute')
final class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: _RemindersViewModel.new,
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.surface,
                title: Text(
                  'Reminders',
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: context.screenPaddingRight * .5,
                    child: AdvancedButtonWidget.icon(
                      backgroundColor: context.colors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: context.radius8,
                        side: BorderSide(
                          color: context.colors.primary,
                          width: 2,
                        ),
                      ),
                      icon: Icon(
                        Icons.add_rounded,
                        color: context.colors.primary,
                      ),
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              body: const _RemindersViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<_RemindersViewModel>(),
          ],
        );
      },
    );
  }
}

@immutable
final class _RemindersViewBodyWidget extends ViewModelWidget<_RemindersViewModel> {
  const _RemindersViewBodyWidget();

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        // SliverPadding(
        //   padding: context.screenPadding,
        //   sliver: SliverList.builder(
        //     itemCount: viewModel.myQuoteList.length,
        //     itemBuilder: (context, index) {
        //       final quote = viewModel.myQuoteList[index];
        //       return _QuoteRowWidget(quote: quote);
        //     },
        //   ),
        // ),
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
