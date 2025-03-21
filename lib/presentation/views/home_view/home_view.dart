import 'dart:async';
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
import 'package:quotely/data/services/user_service/user_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/multiselector_viewmodel_widget.dart';
import 'package:quotely/presentation/abstracts/vselector_with_viewmodel_widget.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/presentation/views/categories_bottom_sheet/categories_bottom_sheet.dart';
import 'package:quotely/presentation/views/home_view/home_viewmodel.dart';
import 'package:quotely/presentation/views/settings_bottom_sheet/settings_bottom_sheet.dart';
import 'package:quotely/presentation/views/sign_bottom_sheets/login_bottom_sheet/login_bottom_sheet.dart';
import 'package:quotely/presentation/views/themes_bottom_sheet/themes_bottom_sheet.dart';
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
      onViewModelReady: (viewModel) async {
        unawaited(
          Future.wait(
            List.generate(124, (index) => 'assets/backgrounds/${index + 1}.webp').map(
              (element) => precacheImage(
                ExactAssetImage(element),
                context,
              ),
            ),
          ),
        );
        return viewModel.init(context);
      },
      builder: (context, model, child) {
        return const Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
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
