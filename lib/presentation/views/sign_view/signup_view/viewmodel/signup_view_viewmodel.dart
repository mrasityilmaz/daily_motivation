// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/core/services/logger_service.dart';
import 'package:quotely/data/services/auth_service/auth_service.dart';
import 'package:quotely/data/services/user_service/user_service.dart';
import 'package:quotely/injection/injection_container.dart';
import 'package:quotely/presentation/helpers/nested_scrollable_focus.dart';
import 'package:quotely/presentation/views/sign_view/signup_view/viewmodel/base_signup_viewmodel.dart';

final class SignUpViewModel extends SignUpViewModelInterface with NestedScrollableFocus {
  SignUpViewModel({
    required super.primary,
    super.scrollController,
  }) : super(
          emailController: TextEditingController(),
          emailFocusNode: FocusNode(),
          passwordController: TextEditingController(),
          passwordFocusNode: FocusNode(),
          rePasswordController: TextEditingController(),
          rePasswordFocusNode: FocusNode(),
          formKey: GlobalKey<FormState>(),
          authService: AuthService(),
          userService: locator<UserService>(),
          appRouter: locator<AppRouter>(),
        ) {
    initFocusListener();
  }

  @override
  Future<void> signUpWithEmailAndPassword() async {
    try {
      final bool formValidated = formKey.currentState?.validate() == true;
      if (formValidated == false || emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      await runBusyFuture(
        authService.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        ),
      ).then(
        onSignResponse,
      );
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  @override
  @protected
  Future<void> onSignResponse(
    EitherOr<UserCredential> response,
  ) async {
    await response.fold(
      (l) async {
        debugPrint('User sign up failed');
        // TODO - show error message
        await appRouter.maybePopTop();
      },
      (r) async {
        debugPrint('User sign up success');
        // TODO - navigate to sign in
        // ignore: invalid_use_of_protected_member
        await runBusyFuture(userService.initUser()).then(
          (_) => appRouter.maybePopTop(),
        );

        //  await const AccountReadySheet(
        //   showEmailVerificationInfo: true,
        // ).showAsModalBottomSheet<void>(context);

        // await sendEmailVerification();
      },
    );
  }

  @override
  List<FocusNode> get focusNodes => [emailFocusNode, passwordFocusNode, rePasswordFocusNode];

  @override
  ScrollController? get nestedScrollController => scrollController;

  @override
  void dispose() {
    debugPrint('SignUpViewModel disposed');
    super.dispose();
    if (primary) {
      scrollController?.dispose();
    }
  }
}
