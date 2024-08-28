part of '../themes_bottom_sheet.dart';

@immutable
final class _ThemesBottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ThemesBottomSheetAppBar();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        'Themes',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        AdvancedButtonWidget.text(
          text: 'Kilitleri Kaldır',
          textColor: context.colors.onSurface,
          backgroundColor: Colors.transparent,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
