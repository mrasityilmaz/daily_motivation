part of '../themes_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomScrollView(
      controller: PrimaryScrollController.maybeOf(context),
      slivers: [
        SliverPadding(
          padding:
              const PaddingConstants.screenPaddingVertical() + const PaddingConstants.screenPaddingHorizontal() * .5,
          sliver: const _GridBuilder(),
        ),
        const SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }
}
