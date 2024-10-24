part of '../login_view.dart';

@immutable
final class _LoginMainWidget extends ViewModelWidget<LoginViewModel> {
  const _LoginMainWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return NestedScrollView(
      controller: viewModel.scrollController,
      headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
        return [
          HeaderSliverAppBarWidget(
            canPop: true,
            primary: viewModel.primary,
            innerBoxIsScrolled: innerBoxIsScrolled,
            collapsedTitle: LocaleKeys.sign_sign_in.tr(),
            expandedTitle: LocaleKeys.sign_welcome_back.tr(),
            expandedSubtitle: LocaleKeys.sign_sign_in_to_your_account.tr(),
          ),
        ];
      },
      body: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: ClampingScrollPhysics(),
        key: PageStorageKey<String>('LoginView'),
        slivers: [
          SliverInjector(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _BodyWidget(),
          ),
        ],
      ),
    );
  }
}

@immutable
final class _BodyWidget extends ViewModelWidget<LoginViewModel> {
  const _BodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.normalTop() * 1.5,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FormSection(),
          _OrDivider(),
          _AppleSignButton(),
          Gap.normalHeight(),
          _GoogleSignButton(),
          Gap.highHeight(),
          _DontHaveAnAccountButton(),
          Gap.H(400),
        ],
      ),
    );
  }
}
