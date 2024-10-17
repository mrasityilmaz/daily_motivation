part of '../themes_bottom_sheet.dart';

@immutable
final class _GridBuilder extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _GridBuilder() : super(reactive: false);

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: const PaddingConstants.screenPaddingRight().right * .5,
        mainAxisSpacing: const PaddingConstants.screenPaddingRight().right * .5,
        childAspectRatio: .85,
      ),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) => _ImageBoxWidget(
            constraints: constraints,
            index: index,
          ),
        );
      },
      itemCount: viewModel.allBackgroundList.length,
    );
  }
}
