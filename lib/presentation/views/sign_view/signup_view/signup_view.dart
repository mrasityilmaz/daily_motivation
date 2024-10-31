import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/extensions/validator_extension.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/abstracts/sheetable_view.dart';
import 'package:quotely/presentation/components/viewmodel_builder.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/header_sliver_appbar.dart';
import 'package:quotely/presentation/core_widgets/slivers/sliver_injector.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/sign_view/login_view/login_view.dart';
import 'package:quotely/presentation/views/sign_view/signup_view/viewmodel/signup_view_viewmodel.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';
import 'package:stacked/stacked.dart';

part 'widgets/form_section.dart';
part 'widgets/have_already_account_button.dart';
part 'widgets/main_body.dart';
part 'widgets/text_fields.dart';

@RoutePage(name: 'SignUpViewRoute')
@immutable
final class SignUpView extends StatelessSheetableWidget {
  const SignUpView({super.key}) : super(primary: true);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      viewModelBuilder: () => SignUpViewModel(
        scrollController: createScrollController(context),
        primary: primary,
      ),
      builder: (context, viewModel, child) {
        return const ViewModelBodyBuilder<SignUpViewModel>(
          body: _MainSignUpBody(),
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
      enableDrag: false,
      expand: true,
    ).showBottomSheet(
      context,
    );
  }
}
