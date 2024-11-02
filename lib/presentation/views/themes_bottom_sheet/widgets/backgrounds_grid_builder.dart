part of '../themes_bottom_sheet.dart';

@immutable
final class _GridBuilder extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _GridBuilder() : super(reactive: false);

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    return SliverPadding(
      padding: const PaddingConstants.screenPaddingVertical() + const PaddingConstants.screenPaddingHorizontal() * .5,
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: const PaddingConstants.screenPaddingRight().right * .5,
          mainAxisSpacing: const PaddingConstants.screenPaddingRight().right * .5,
          childAspectRatio: .85,
        ),
        itemBuilder: (context, index) {
          final String backgroundPath = viewModel.allBackgroundList[index];
          // Background image is premium or not
          final bool isPremium = viewModel.isThemeConfigPremium(index);

          return _ImageBoxWidget(
            backgroundPath: backgroundPath,
            isPremium: isPremium,
          );
        },
        itemCount: viewModel.allBackgroundList.length,
      ),
    );
  }
}
