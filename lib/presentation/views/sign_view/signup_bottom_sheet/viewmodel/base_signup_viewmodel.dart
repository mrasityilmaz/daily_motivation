import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quotely/config/navigator/app_router.dart';
import 'package:quotely/core/extensions/dartz_extension.dart';
import 'package:quotely/data/services/auth_service/auth_service.dart';
import 'package:quotely/data/services/user_service/user_service.dart';
import 'package:quotely/presentation/core_widgets/slivers/header_sliver_appbar.dart';
import 'package:stacked/stacked.dart';

abstract class SignUpViewModelInterface extends BaseViewModel {
  SignUpViewModelInterface({
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.rePasswordController,
    required this.rePasswordFocusNode,
    required this.formKey,
    required this.authService,
    required this.userService,
    required this.appRouter,
    required this.primary,
    this.scrollController,
  });

  /// This is the speacial parameter that will be passed from the parent widget
  /// to the viewmodel. This is used in [HeaderSliverAppBarWidget] to work properly
  /// with the NestedScrollView.
  ///
  /// Why it is not a part of the Widget?
  /// - Because it is using the widget which is located -3 levels down the widget tree
  ///
  /// Last thing, this decide this View showing as a primary view or sheet view
  final bool primary;

  // MARK: - Controllers & FocusNodes & Keys

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode rePasswordFocusNode;

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

  Future<void> signUpWithEmailAndPassword();

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
    rePasswordController.dispose();
    rePasswordFocusNode.dispose();
    super.dispose();
  }
}
