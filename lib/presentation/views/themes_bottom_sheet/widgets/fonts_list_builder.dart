part of '../themes_bottom_sheet.dart';

@immutable
final class _FontListBuilder extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _FontListBuilder() : super(reactive: false);

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    return SliverPadding(
      padding: const PaddingConstants.screenPaddingVertical() + const PaddingConstants.screenPaddingHorizontal(),
      sliver: SliverList.builder(
        itemBuilder: (context, index) {
          final DefaultFontsEnum font = viewModel.allDefaultFontList[index];

          return ListTile(
            title: Text(
              'AaBbCc',
              style: GoogleFonts.getFont(font.fontFamily).copyWith(
                fontSize: (font.maxFontSize + font.minFontSize) / 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              font.fontFamily,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface.withOpacity(.5)),
            ),
            contentPadding: EdgeInsets.zero,
            dense: true,
            shape: Border(
              bottom: BorderSide(
                color: context.colors.onSurface.withOpacity(.1),
              ),
            ),
            onTap: () {},
          );
        },
        itemCount: viewModel.allDefaultFontList.length,
      ),
    );
  }
}
