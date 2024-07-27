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
        ...CategoryGroup.values.map(
          (e) => _CategoriesSection(
            categoryGroup: e,
          ),
        ),
        const SliverBottomSafeWidget(),
      ],
    );
  }
}
