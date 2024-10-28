part of '../categories_view.dart';

@immutable
final class _CategoriesBottomSheetAppBar extends SelectorViewModelWidget<CategoriesBottomSheetViewModel, bool>
    implements PreferredSizeWidget {
  const _CategoriesBottomSheetAppBar({required this.primary});
  final bool primary;

  @override
  AppBar build(BuildContext context, bool isPremium) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        LocaleKeys.categories_categories.tr(),
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
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
