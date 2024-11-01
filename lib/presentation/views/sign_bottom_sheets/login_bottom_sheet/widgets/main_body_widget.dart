part of '../login_bottom_sheet.dart';

@immutable
final class _LoginMainWidget extends ViewModelWidget<LoginViewModel> {
  const _LoginMainWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return NestedScrollView(
      clipBehavior: Clip.none,
      physics: const PageScrollPhysics(),
      controller: viewModel.scrollController,
      headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
        return [
          HeaderSliverAppBarWidget(
            canPop: true,
            primary: false,
            innerBoxIsScrolled: innerBoxIsScrolled,
            collapsedTitle: LocaleKeys.sign_sign_in.tr(),
            expandedTitle: LocaleKeys.sign_welcome_back.tr(),
            expandedSubtitle: LocaleKeys.sign_sign_in_to_your_account.tr(),
          ),
        ];
      },
      body: const CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
    return const Padding(
      padding: PaddingConstants.screenPadding(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FormSection(),
          Gap.mediumHeight(),
          _DontHaveAnAccountButton(),
          _OrDivider(),
          _AppleSignButton(),
          Gap.normalHeight(),
          _GoogleSignButton(),
        ],
      ),
    );
  }
}
