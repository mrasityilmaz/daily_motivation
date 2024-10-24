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
import 'package:quotely/presentation/views/sign_view/login_view/viewmodel/base_login_viewmodel.dart';

part 'mixins/sign_helper.dart';

final class LoginViewModel extends LoginViewModelInterface with NestedScrollableFocus, _ViewModelSignHelper {
  LoginViewModel({
    required super.primary,
    super.scrollController,
  }) : super(
          emailController: TextEditingController(),
          emailFocusNode: FocusNode(),
          passwordController: TextEditingController(),
          passwordFocusNode: FocusNode(),
          formKey: GlobalKey<FormState>(),
          authService: AuthService(),
          userService: locator<UserService>(),
          appRouter: locator<AppRouter>(),
        ) {
    // For [NestedScrollableFocus]
    initFocusListener();
  }

  @override
  void dispose() {
    debugPrint('LoginBottomSheetViewModel disposed');
    super.dispose();
    if (primary) {
      scrollController?.dispose();
    }
  }

  // From [NestedScrollableFocus]
  @override
  List<FocusNode> get focusNodes => [emailFocusNode, passwordFocusNode];
// From [NestedScrollableFocus]
  @override
  ScrollController? get nestedScrollController => scrollController;
}
