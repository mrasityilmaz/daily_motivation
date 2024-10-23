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
import 'package:stacked/stacked.dart';

part 'viewmodel_mixins/logic_helper.dart';

final class SignUpViewModel extends BaseViewModel with _LogicHelper, NestedScrollableFocus {
  SignUpViewModel({this.scrollController}) {
    initFocusListener();
  }

  // Do not dispose this scrollController because it is passed from the parent widget
  final ScrollController? scrollController;

  final AuthService _authService = AuthService();
  final UserService _userService = locator<UserService>();
  final AppRouter _appRouter = locator<AppRouter>();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      final bool formValidated = formKey.currentState?.validate() == true;
      if (formValidated == false || emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      await runBusyFuture(
        _authService.createUserWithEmailAndPassword(
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

  @protected
  FutureOr<void> onSignResponse(
    EitherOr<UserCredential> response,
  ) {
    response.fold(
      (l) async {
        debugPrint('User sign up failed');
        // TODO - show error message
        await _appRouter.maybePopTop();
      },
      (r) async {
        debugPrint('User sign up success');
        // TODO - navigate to sign in
        // ignore: invalid_use_of_protected_member
        await runBusyFuture(_userService.initUser()).then(
          (_) => _appRouter.maybePopTop(),
        );

        // await sendEmailVerification();
      },
    );
  }

  @override
  List<FocusNode> get focusNodes => [emailFocusNode, passwordFocusNode, rePasswordFocusNode];

  @override
  ScrollController? get nestedScrollController => scrollController;
}
