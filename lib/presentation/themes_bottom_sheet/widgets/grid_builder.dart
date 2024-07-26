part of '../themes_bottom_sheet.dart';

@immutable
final class _GridBuilder extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _GridBuilder() : super(reactive: false);

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: context.screenPaddingRight.right * .5,
        mainAxisSpacing: context.screenPaddingRight.right * .5,
        childAspectRatio: .85,
      ),
      itemBuilder: (context, index) {
        final String currentBackgroundPath = viewModel.allBackgroundList[index];
        final DefaultFontsEnum currentFont = viewModel.allDefaultFontList[index % viewModel.allDefaultFontList.length];

        return LayoutBuilder(
          builder: (context, constraints) => _ImageBoxWidget(
            constraints: constraints,
            font: currentFont,
            backgroundPath: currentBackgroundPath,
            index: index,
          ),
        );
      },
      itemCount: viewModel.allBackgroundList.length,
    );
  }
}
