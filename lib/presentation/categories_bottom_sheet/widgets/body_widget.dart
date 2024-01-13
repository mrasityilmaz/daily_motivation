part of '../categories_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: context.screenPadding + context.paddingNormalBottom,
            child: AdvancedButtonWidget.text(
              expand: true,
              text: 'Create your own mix',
              onPressed: () {},
              textStyle: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...CategoryGroup.values.map(
          (e) => _CategoriesSection(
            categoryGroup: e,
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
