part of '../themes_bottom_sheet.dart';

@immutable
final class _BodyWidget extends ViewModelWidget<_ThemesBottomSheetViewModel> {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, _ThemesBottomSheetViewModel viewModel) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: context.screenPaddingVertical + context.screenPaddingHorizontal * .5,
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: context.screenPaddingRight.right * .5,
              mainAxisSpacing: context.screenPaddingRight.right * .5,
              childAspectRatio: .85,
            ),
            itemBuilder: (context, index) {
              final String currentBackgroundPath = viewModel.allBackgroundList[index];
              final DefaultFontsEnum currentFont = viewModel.allDefaultFontList[index % viewModel.allDefaultFontList.length];

              return _ImageBoxWidget(
                font: currentFont,
                backgroundPath: currentBackgroundPath,
                isLocked: index > 8,
                onChanged: (newBg) async {
                  await viewModel.updateThemeConfiguration(model: newBg);
                },
              );
            },
            itemCount: viewModel.allBackgroundList.length,
          ),
        ),
        SliverSafeArea(
          minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
          sliver: const SliverToBoxAdapter(
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
