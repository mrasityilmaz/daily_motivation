import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

final class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final ScrollController scrollController = ScrollController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    debugPrint('LoginBottomSheetViewModel disposed');
    scrollController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
