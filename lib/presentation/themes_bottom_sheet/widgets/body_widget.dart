part of '../themes_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: context.screenPaddingVertical + context.screenPaddingHorizontal * .5,
          sliver: const _GridBuilder(),
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
