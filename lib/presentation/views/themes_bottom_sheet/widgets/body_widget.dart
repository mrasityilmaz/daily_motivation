part of '../themes_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(
    BuildContext context,
  ) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ModalScrollController.of(context),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const _ThemesBottomSheetAppBar(),
          ];
        },
        body: TabBarView(
          clipBehavior: Clip.none,
          controller: DefaultTabController.maybeOf(context),
          physics: const BouncingScrollPhysics(),
          children: const [
            CustomScrollView(
              clipBehavior: Clip.none,
              slivers: [
                _GridBuilder(),
                SliverAdaptiveBottomSafeAreaWidget(),
              ],
            ),
            CustomScrollView(
              clipBehavior: Clip.none,
              slivers: [
                _FontListBuilder(),
                SliverAdaptiveBottomSafeAreaWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
