part of '../categories_view.dart';

@immutable
final class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection({required this.categoryGroup});

  final CategoryGroup categoryGroup;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: kToolbarHeight * .8,
        decoration: BoxDecoration(
          color: true ? context.appColors.darkGreyColor : context.appColors.lightGreyColor,
        ),
        padding: const PaddingConstants.allLow(),
        child: Row(
          children: [
            Text(categoryGroup.name, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      sliver: SliverPadding(
        padding: const PaddingConstants.screenPaddingHorizontal() * .5 +
            const PaddingConstants.mediumBottom() +
            const PaddingConstants.screenPaddingTop(),
        sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: const PaddingConstants.screenPaddingHorizontal().horizontal / 4,
            mainAxisSpacing: const PaddingConstants.screenPaddingHorizontal().horizontal / 4,
            childAspectRatio: 2.3,
          ),
          itemCount: categoryGroup.subCategories.length,
          itemBuilder: (context, index) {
            return _SubCategoriesButton(
              category: categoryGroup.subCategories[index],
            );
          },
        ),
      ),
    );
  }
}
