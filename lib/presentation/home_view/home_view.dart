import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_motivation/assets.dart';
import 'package:daily_motivation/core/constants/categories_enum.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/data/models/quote_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/categories_bottom_sheet/categories_bottom_sheet.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:daily_motivation/presentation/dialogs/app_dialogs.dart';
import 'package:daily_motivation/presentation/home_view/home_viewmodel.dart';
import 'package:daily_motivation/presentation/themes_bottom_sheet/themes_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

part 'widgets/bottom_buttons_section.dart';
part 'widgets/like_and_other_buttons_section.dart';
part 'widgets/main_body_widget.dart';
part 'widgets/quote_text_section.dart';
part 'widgets/swipable_body_section.dart';
part 'widgets/top_section.dart';

@immutable
@RoutePage(name: 'HomeViewRoute')
final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: HomeViewModel.new,
      onViewModelReady: (viewModel) async => viewModel.init(),
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
