part of '../categories_bottom_sheet.dart';

@immutable
final class _CategoriesBottomSheetAppBar extends SelectorViewModelWidget<_CategoriesBottomSheetViewModel, bool> implements PreferredSizeWidget {
  const _CategoriesBottomSheetAppBar();

  @override
  AppBar build(BuildContext context, bool isPremium) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        'Categories',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        if (!isPremium) ...[
          AdvancedButtonWidget.text(
            text: 'Kilitleri Kaldır',
            backgroundColor: Colors.transparent,
            onPressed: () {},
            textColor: context.colors.onBackground,
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool selector(_CategoriesBottomSheetViewModel viewModel) {
    return viewModel.isPremium;
  }
}
