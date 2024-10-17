part of '../categories_bottom_sheet.dart';

@immutable
final class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection({required this.categoryGroup});

  final CategoryGroup categoryGroup;

  @override
  Widget build(BuildContext context) {
    return MultiSliverGridSection(
      title: Container(
        height: kToolbarHeight,
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
      gridChildrenPadding: const PaddingConstants.screenPaddingHorizontal() * .5 +
          const PaddingConstants.mediumBottom() +
          const PaddingConstants.screenPaddingTop(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: const PaddingConstants.screenPaddingHorizontal().horizontal / 4,
        mainAxisSpacing: const PaddingConstants.screenPaddingHorizontal().horizontal / 4,
        childAspectRatio: 2.3,
      ),
      items: categoryGroup.subCategories.map((s) {
        return _SubCategoriesButton(
          category: s,
        );
      }).toList(),
    );
  }
}
