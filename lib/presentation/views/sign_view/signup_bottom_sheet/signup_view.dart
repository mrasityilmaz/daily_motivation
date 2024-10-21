import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/core/extensions/validator_extension.dart';
import 'package:quotely/presentation/core_widgets/custom_button/custom_button.dart';
import 'package:quotely/presentation/core_widgets/slivers/header_sliver_appbar.dart';
import 'package:quotely/presentation/core_widgets/slivers/sliver_injector.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/sign_view/signup_bottom_sheet/signup_view_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/have_already_account_button.dart';
part 'widgets/text_fields.dart';

@immutable
final class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      viewModelBuilder: () => SignUpViewModel(scrollController: ModalScrollController.of(context)),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: NestedScrollView(
            controller: viewModel.scrollController,
            headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
              return [
                HeaderSliverAppBarWidget(
                  canPop: true,
                  innerBoxIsScrolled: innerBoxIsScrolled,
                  collapsedTitle: 'Register',
                  expandedTitle: 'Register',
                  expandedSubtitle: 'Create your account',
                ),
              ];
            },
            body: const CustomScrollView(
              key: PageStorageKey<String>('RegisterView'),
              slivers: [
                SliverInjector(),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _BodyWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets.showBottomSheet(
      context,
      child: const SignUpView(),
      constraints: BoxConstraints.expand(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
      ),
      enableDrag: false,
      bounce: false,
      expand: true,
      useRootNavigator: true,
    );
  }
}

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.normalTop() * 1.5,
      child: Column(
        children: [
          const _EmailTextField(),
          const Gap.mediumHeight(),
          const _PasswordTextField(),
          const Gap.mediumHeight(),
          const _ConfirmPasswordTextField(),
          const Gap.mediumHeight(),
          const Spacer(),
          CustomButton.text(
            text: 'Register',
            onPressed: () {
              // locator<ThemeService>().toggleDarkLightTheme();
            },
            expand: true,
            textStyle:
                context.textTheme.titleMedium?.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
          ),
          const Gap.mediumHeight(),
          const _HaveAlreadyAccountButton(),
        ],
      ),
    );
  }
}
