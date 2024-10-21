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
import 'package:quotely/presentation/views/sign_view/login_bottom_sheet/login_view_viewmodel.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';

part 'widgets/dont_have_account_button.dart';
part 'widgets/text_fields.dart';

@immutable
final class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: LoginViewModel.new,
      builder: (context, viewModel, child) {
        return NestedScrollView(
          controller: ModalScrollController.of(context),
          headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
            return [
              HeaderSliverAppBarWidget(
                canPop: true,
                primary: false,
                innerBoxIsScrolled: innerBoxIsScrolled,
                collapsedTitle: 'Sign In',
                expandedTitle: 'Welcome back!',
                expandedSubtitle: 'Sign in to your account',
              ),
            ];
          },
          body: const CustomScrollView(
            physics: ClampingScrollPhysics(),
            key: PageStorageKey<String>('LoginView'),
            slivers: [
              SliverInjector(),
              SliverToBoxAdapter(
                child: _BodyWidget(),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<T?> showAsModalBottomSheet<T>(BuildContext context) async {
    return Sheets.showBottomSheet(
      context,
      child: const LoginView(),
      bounce: false,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onPressed: () {},
            backgroundColor: context.appColors.primarySwatch.shade800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: context.appColors.lightGreyColor.withOpacity(.9)),
                const Gap.lowWidth(),
                Text(
                  'Sign in with Email',
                  style: context.textTheme.bodyMedium?.copyWith(
                    inherit: false,
                    fontSize: 44 * 0.43,
                    fontFamily: '.SF Pro Text',
                    letterSpacing: -0.41,
                    color: context.appColors.lightGreyColor.withOpacity(.9),
                  ),
                ),
              ],
            ),
          ),
          const Gap.normalHeight(),
          SignInWithAppleButton(onPressed: () {}, style: SignInWithAppleButtonStyle.white),
          const Gap.normalHeight(),
          CustomButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.white),
                const Gap.lowWidth(),
                Text(
                  'Sign in with Google',
                  style: context.textTheme.bodyMedium?.copyWith(
                    inherit: false,
                    fontSize: 44 * 0.43,
                    fontFamily: '.SF Pro Text',
                    letterSpacing: -0.41,
                  ),
                ),
              ],
            ),
          ),
          const _DontHaveAnAccountButton(),
        ],
      ),
    );
  }
}
