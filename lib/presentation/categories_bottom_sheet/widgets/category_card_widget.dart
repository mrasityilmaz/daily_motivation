part of '../categories_bottom_sheet.dart';

@immutable
final class _SubCategoriesButton extends ViewModelWidget<_CategoriesBottomSheetViewModel> {
  const _SubCategoriesButton({
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context, _CategoriesBottomSheetViewModel viewModel) {
    final bool isSelected = viewModel.isCategorySelected(category);
    return AdvancedButtonWidget(
      expand: true,
      backgroundColor: isSelected ? context.colors.primary.withOpacity(.75) : context.colors.primary.withOpacity(.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: context.colors.primary.withOpacity(.3),
        ),
      ),
      onPressed: category.isPremium
          ? () async {
              await AppDialogs.instance.showDialog<void>(
                context,
                child: ShowOrPayDialogBody(
                  icon: Icon(
                    Platform.isAndroid ? Icons.grid_view_rounded : CupertinoIcons.square_grid_2x2,
                    size: kMinInteractiveDimension * 1.2,
                    color: context.colors.primary,
                  ),
                  firstButtonText: 'Premium Ol',
                  firstButtonOnPressed: () async {
                    await locator<AppRouter>().pop();
                  },
                  title: 'Seçili Kategorinin Kilidini Aç',
                ),
              );
            }
          : () async {
              await viewModel.changeCategory(category: [category], locale: context.locale.languageCode).then((value) {});
            },
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
                  child: Image.asset(category.iconPath),
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
                style: context.textTheme.bodyMedium?.copyWith(color: isSelected ? context.colors.onPrimary : context.colors.onBackground.withOpacity(.75), fontWeight: FontWeight.w600),
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
                      color: context.colors.onBackground,
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
}
