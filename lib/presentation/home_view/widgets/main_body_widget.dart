part of '../home_view.dart';

@immutable
final class _MainBodyWidget extends SelectorViewModelWidget<HomeViewModel, String> {
  const _MainBodyWidget();

  @override
  Widget build(BuildContext context, String selectedBackground) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(selectedBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: const __Body(),
    );
  }

  @override
  String selector(HomeViewModel viewModel) {
    return viewModel.currentThemeConfiguration.backgroundPath;
  }
}

@immutable
final class __Body extends StatelessWidget {
  const __Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: context.adaptiveScreenPaddingBottom + EdgeInsets.only(top: context.adaptiveScreenPaddingBottom.bottom),
      child: const Column(
        children: [
          _TopSection(),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: _SwipableBodySection(),
                ),
                Positioned.fill(
                  child: _LikeAndOtherButtonsSection(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
