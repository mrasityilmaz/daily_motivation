import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_motivation/core/constants/default_fonts_enum.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/extensions/list_extension.dart';
import 'package:daily_motivation/data/models/quote_model.dart';
import 'package:daily_motivation/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:daily_motivation/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

part 'font_settings_bottom_sheet_viewmodel.dart';
part 'widgets/body_widget.dart';

@immutable
final class FontSettingsBottomSheet extends StatelessWidget {
  const FontSettingsBottomSheet({required this.quoteModel, super.key});
  final QuoteModel quoteModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_FontSettingsBottomSheetViewModel>.nonReactive(
      viewModelBuilder: () => _FontSettingsBottomSheetViewModel(quoteModel: quoteModel),
      builder: (context, model, child) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) => Stack(
            children: [
              _BodyWidget(scrollController: scrollController),
              const ViewModelLoadingIndicator<_FontSettingsBottomSheetViewModel>(),
            ],
          ),
        );
      },
    );
  }
}
