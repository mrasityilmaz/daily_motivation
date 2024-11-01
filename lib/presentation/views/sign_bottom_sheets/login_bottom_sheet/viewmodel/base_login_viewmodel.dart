import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/services/auth_service/auth_service.dart';
import 'package:quotely/data/services/user_service/user_service.dart';
import 'package:stacked/stacked.dart';

@visibleForTesting
abstract class LoginViewModelInterface extends BaseViewModel {
  LoginViewModelInterface({
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.formKey,
    required this.authService,
    required this.userService,
    required this.appRouter,
    this.scrollController,
  });

  // MARK: - Controllers & FocusNodes & Keys

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  final GlobalKey<FormState> formKey;

  // Do not dispose this scrollController because it is passed from the parent widget
  final ScrollController? scrollController;

  // MARK: - Services

  @protected
  final AuthService authService;
  @protected
  final UserService userService;
  @protected
  final AppRouter appRouter;

  // MARK: - Methods

  Future<void> signWithApple();
  Future<void> signWithGoogle();
  Future<void> signWithEmailAndPassword();

  /// When the sign response is received, this method is called
  /// to handle the response.
  ///
  /// Success ->  Run userService.initUser() function, which will initialize the user
  ///            and navigate to the home screen then show a success message
  ///
  /// Failure ->  Show an error message and maybe pop the top of the navigator
  ///
  @protected
  Future<void> onSignResponse(EitherOr<UserCredential> response);

  // MARK: - Dispose
  @override
  @mustCallSuper
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
