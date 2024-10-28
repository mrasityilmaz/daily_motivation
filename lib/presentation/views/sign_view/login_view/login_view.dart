import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/extensions/validator_extension.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/header_sliver_appbar.dart';
import 'package:quotely/presentation/core_widgets/slivers/sliver_injector.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/sign_view/login_view/viewmodel/login_viewmodel.dart';
import 'package:quotely/presentation/views/sign_view/signup_view/signup_view.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';
import 'package:stacked/stacked.dart';

part 'widgets/dont_have_account_button.dart';
part 'widgets/form_section.dart';
part 'widgets/main_body_widget.dart';
part 'widgets/or_divider.dart';
part 'widgets/sign_buttons.dart';
part 'widgets/text_fields.dart';

@RoutePage(name: 'LoginViewRoute')
@immutable
final class LoginView extends StatelessSheetableWidget {
  const LoginView({
    super.key,
    // This means that this view is a primary view not a sheet view
    super.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(
        primary: primary,
        scrollController: createScrollController(context),
      ),
      builder: (context, viewModel, child) {
        return const Stack(
          children: [
            _LoginMainWidget(),
            ViewModelLoadingIndicator<LoginViewModel>(),
          ],
        );
      },
    );
  }

  ScrollController? createScrollController(BuildContext context) {
    if (primary) {
      return ScrollController();
    }
    return ModalScrollController.of(context);
  }

  @override
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets(
      child: this,
      closeProgressThreshold: .5,
    ).showBottomSheet(
      context,
    );
  }
}
