part of '../signup_bottom_sheet.dart';

@immutable
final class _MainSignUpBody extends ViewModelWidget<SignUpViewModel> {
  const _MainSignUpBody() : super(reactive: false);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Scaffold(
      body: NestedScrollView(
        physics: const PageScrollPhysics(),
        controller: viewModel.scrollController,
        headerSliverBuilder: (nestedContext, innerBoxIsScrolled) {
          return [
            HeaderSliverAppBarWidget(
              canPop: true,
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
      ),
    );
  }
}
