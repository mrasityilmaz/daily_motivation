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
        padding: context.screenPaddingHorizontal,
        child: Row(
          children: [
            Text(categoryGroup.name, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      gridChildrenPadding:
          context.screenPaddingHorizontal * .5 + context.paddingMediumBottom + context.screenPaddingTop,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: context.screenPaddingHorizontal.horizontal / 4,
        mainAxisSpacing: context.screenPaddingHorizontal.horizontal / 4,
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
