part of '../login_viewmodel.dart';

mixin _ViewModelSignHelper on LoginViewModelInterface {
  @override
  Future<void> signWithApple() async {
    try {
      await runBusyFuture(authService.signInWithApple()).then(
        onSignResponse,
      );
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  @override
  Future<void> signWithGoogle() async {
    try {
      await runBusyFuture(authService.signInWithGoogle()).then(
        onSignResponse,
      );
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  @override
  Future<void> signWithEmailAndPassword() async {
    try {
      final bool formValidated = formKey.currentState?.validate() == true;
      if (formValidated == false || emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      await runBusyFuture(
        authService.signInWithEmailAndPassword(
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
    await response.fold<Future<void>>(
      (l) async {
        debugPrint('User sign in failed');
        // TODO - show error message
        await appRouter.maybePopTop();
      },
      (r) async {
        debugPrint('User sign in success');
        // TODO - navigate to home
        // ignore: invalid_use_of_protected_member
        await runBusyFuture(userService.initUser()).then(
          (_) => appRouter.maybePopTop(),
        );

        // TODO - show success message
      },
    );
  }
}
