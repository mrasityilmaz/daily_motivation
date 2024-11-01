part of '../categories_bottom_sheet.dart';

@immutable
final class _CategoriesBottomSheetAppBar extends SelectorViewModelWidget<CategoriesBottomSheetViewModel, bool>
    implements PreferredSizeWidget {
  const _CategoriesBottomSheetAppBar();

  @override
  SliverAppBar build(BuildContext context, bool isPremium) {
    return SliverAppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        LocaleKeys.categories_categories.tr(),
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      primary: false,
      centerTitle: true,
      pinned: true,
      // actions: [
      //   if (!isPremium) ...[
      //     CustomButton.text(
      //       text: 'Kilitleri Kaldır',
      //       onPressed: () {},
      //       textColor: context.colors.onSurface,
      //     ),
      //   ],
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool selector(CategoriesBottomSheetViewModel viewModel) {
    return viewModel.isPremium;
  }
}
