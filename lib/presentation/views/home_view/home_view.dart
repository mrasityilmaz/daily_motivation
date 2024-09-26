import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotely/assets.dart';
import 'package:quotely/core/constants/enums/categories_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:quotely/presentation/overrides/multiselector_viewmodel_widget.dart';
import 'package:quotely/presentation/overrides/vselector_with_viewmodel_widget.dart';
import 'package:quotely/presentation/views/home_view/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/bottom_buttons_section.dart';
part 'widgets/like_and_other_buttons_section.dart';
part 'widgets/main_body_widget.dart';
part 'widgets/quote_text_section.dart';
part 'widgets/swipable_body_section.dart';
part 'widgets/top_buttons_section.dart';

@immutable
@RoutePage(name: 'HomeViewRoute')
final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: HomeViewModel.new,
      onViewModelReady: (viewModel) async => viewModel.init(context),
      builder: (context, model, child) {
        return const Stack(
          children: [
            Scaffold(
              extendBody: true,
              bottomNavigationBar: _BottomButtonsSection(),
              body: _MainBodyWidget(),
            ),
            ViewModelLoadingIndicator<HomeViewModel>(),
          ],
        );
      },
    );
  }
}
