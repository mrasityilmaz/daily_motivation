part of '../themes_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(
    BuildContext context,
  ) {
    return const CustomScrollView(
      clipBehavior: Clip.none,
      slivers: [
        _ThemesBottomSheetAppBar(),
        _GridBuilder(),
        SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }
}
