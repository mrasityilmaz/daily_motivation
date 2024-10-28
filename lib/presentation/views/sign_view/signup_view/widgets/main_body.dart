part of '../signup_view.dart';

@immutable
final class _MainSignUpBody extends ViewModelWidget<SignUpViewModel> {
  const _MainSignUpBody() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return NestedScrollView(
      controller: viewModel.scrollController,
      headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
        return [
          HeaderSliverAppBarWidget(
            canPop: true,
            primary: viewModel.primary,
            innerBoxIsScrolled: innerBoxIsScrolled,
            collapsedTitle: LocaleKeys.sign_sign_up.tr(),
            expandedTitle: LocaleKeys.sign_sign_up.tr(),
            expandedSubtitle: LocaleKeys.sign_create_your_account.tr(),
          ),
        ];
      },
      body: const CustomScrollView(
        key: PageStorageKey<String>('RegisterView'),
        slivers: [
          SliverInjector(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _FormSection(),
          ),
        ],
      ),
    );
  }
}
