import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_motivation/assets.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/services/category_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/slivers/mutli_sliver_grid.dart';
import 'package:daily_motivation/presentation/dialogs/app_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
    return const Scaffold(
      extendBody: true,
      bottomNavigationBar: _BottomButtonsSection(),
      body: _MainBodyWidget(),
    );
  }
}
