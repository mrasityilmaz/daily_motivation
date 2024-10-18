import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotely/core/constants/enums/default_fonts_enum.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/extensions/text_align_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/data/models/theme_configuration_model/theme_configuration_model.dart';
import 'package:quotely/data/services/theme_configuration_service/theme_configuration_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/vendor/slider_shape_override.dart';
import 'package:stacked/stacked.dart';

part 'font_settings_bottom_sheet_viewmodel.dart';
part 'mixins/calculator_tools_mixin.dart';
part 'mixins/services_mixin.dart';
part 'mixins/text_style_tools_mixin.dart';
part 'widgets/body_widget.dart';

@immutable
final class FontSettingsBottomSheet extends StatelessWidget {
  const FontSettingsBottomSheet({
    required this.quoteModel,
    super.key,
    this.textAreaRect = Rect.zero,
  });
  final QuoteModel quoteModel;
  final Rect textAreaRect;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_FontSettingsBottomSheetViewModel>.nonReactive(
      viewModelBuilder: () =>
          _FontSettingsBottomSheetViewModel(quoteModel: quoteModel, context: context, widgetDefaultRect: textAreaRect),
      builder: (context, model, child) {
        return Stack(
          children: [
            _BodyWidget(scrollController: ScrollController()),
            const ViewModelLoadingIndicator<_FontSettingsBottomSheetViewModel>(),
          ],
        );
      },
    );
  }
}
