part of '../categories_bottom_sheet.dart';

@immutable
final class _SubCategoriesButton extends VSelectorViewModelWidget<CategoriesBottomSheetViewModel, bool> {
  const _SubCategoriesButton({
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context, bool isSelected, CategoriesBottomSheetViewModel viewModel) {
    debugPrint('Rebuild - $category');
    return AdvancedButtonWidget(
      expand: true,
      backgroundColor: isSelected ? context.colors.primary.withOpacity(.75) : context.colors.primary.withOpacity(.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: context.colors.primary.withOpacity(.1),
        ),
      ),
      onPressed: isSelected
          ? null
          : () async => viewModel.changeCategory(
                context,
                category: category,
                locale: context.locale.languageCode,
              ),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: context.paddingLowRight * .5 + context.paddingLowBottom * .5,
              child: FractionallySizedBox(
                heightFactor: .7,
                alignment: Alignment.bottomRight,
                child: FittedBox(
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.fitHeight,
                  child: Image.asset(
                    category.iconPath,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                category.name,
                style: context.textTheme.bodyMedium?.copyWith(color: isSelected ? context.colors.onPrimary : context.colors.onSurface.withOpacity(.75), fontWeight: FontWeight.w600),
              ),
            ),
          ),
          if (category.isPremium && !isSelected) ...[
            Align(
              alignment: Alignment.bottomLeft,
              child: FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                heightFactor: .5,
                child: Padding(
                  padding: context.paddingLow,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(
                      CupertinoIcons.lock_fill,
                      size: 26,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (isSelected) ...[
            Align(
              alignment: Alignment.bottomLeft,
              child: FractionallySizedBox(
                alignment: Alignment.bottomLeft,
                heightFactor: .5,
                child: Padding(
                  padding: context.paddingLow,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(
                      CupertinoIcons.check_mark_circled,
                      size: 26,
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  bool selector(CategoriesBottomSheetViewModel viewModel) {
    return viewModel.isCategorySelected(category);
  }
}
