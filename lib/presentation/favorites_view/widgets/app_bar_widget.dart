part of '../favorites_view.dart';

@immutable
final class _FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _FavoritesAppBar();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: false,
      backgroundColor: context.colors.surface,
      title: Text(
        'Favorites',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
