part of '../categories_bottom_sheet.dart';

@immutable
final class _CategoriesBottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CategoriesBottomSheetAppBar();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        'Categories',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        AdvancedButtonWidget.text(
          text: 'Kilitleri Kaldır',
          backgroundColor: Colors.transparent,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
