part of '../settings_bottom_sheet.dart';

@immutable
final class _SettingsBottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SettingsBottomSheetAppBar();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        'Settings',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        CustomButton.text(
          text: 'Kilitleri Kaldır',
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
