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

final class LoginViewModel extends BaseViewModel with NestedScrollableFocus {
  LoginViewModel(this.scrollController) {
    initFocusListener();
  }
  // Do not dispose this scrollController because it is passed from the parent widget
  final ScrollController? scrollController;
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();
  final UserService _userService = locator<UserService>();
  final AppRouter _appRouter = locator<AppRouter>();

  Future<void> signWithApple() async {
    try {
      await runBusyFuture(_authService.signInWithApple()).then(
        onSignResponse,
      );
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  Future<void> signWithGoogle() async {
    try {
      await runBusyFuture(_authService.signInWithGoogle()).then(
        onSignResponse,
      );
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  Future<void> signWithEmailAndPassword() async {
    try {
      final bool formValidated = formKey.currentState?.validate() == true;
      if (formValidated == false || emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      await runBusyFuture(
        _authService.signInWithEmailAndPassword(
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
      (l) {
        debugPrint('User sign in failed');
        // TODO - show error message
        _appRouter.maybePopTop();
      },
      (r) async {
        debugPrint('User sign in success');
        // TODO - navigate to home
        // ignore: invalid_use_of_protected_member
        await runBusyFuture(_userService.initUser()).then(
          (_) => _appRouter.maybePopTop(),
        );

        // TODO - show success message
      },
    );
  }

  @override
  void dispose() {
    debugPrint('LoginBottomSheetViewModel disposed');
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  List<FocusNode> get focusNodes => [emailFocusNode, passwordFocusNode];

  @override
  ScrollController? get nestedScrollController => scrollController;
}
