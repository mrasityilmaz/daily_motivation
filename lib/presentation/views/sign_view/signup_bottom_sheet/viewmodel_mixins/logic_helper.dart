part of '../signup_view_viewmodel.dart';

mixin _LogicHelper on ChangeNotifier {
  late final ScrollController? scrollController;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode rePasswordFocusNode = FocusNode();

  bool get anyTextFieldFocused => emailFocusNode.hasFocus || passwordFocusNode.hasFocus || rePasswordFocusNode.hasFocus;

  void initFocusNodes() {
    emailFocusNode.addListener(_focusListener);
    passwordFocusNode.addListener(_focusListener);
    rePasswordFocusNode.addListener(_focusListener);
  }

  Future<void> _focusListener() async {
    if (anyTextFieldFocused) {
      await openSliverAppBar();
    } else {
      await closeSliverAppBar();
    }
  }

  Future<void> openSliverAppBar() async {
    if (scrollController == null || !scrollController!.hasClients) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await scrollController!.animateTo(
        scrollController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  Future<void> closeSliverAppBar() async {
    if (scrollController == null || !scrollController!.hasClients) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await scrollController!.animateTo(
        scrollController!.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    emailFocusNode
      ..removeListener(_focusListener)
      ..dispose();
    passwordFocusNode
      ..removeListener(_focusListener)
      ..dispose();
    rePasswordFocusNode
      ..removeListener(_focusListener)
      ..dispose();
    super.dispose();
  }
}
