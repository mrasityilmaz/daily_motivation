import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';

@immutable
final class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.primary = true,
    this.automaticallyImplyLeading = true,
    this.actions,
  });
  final bool primary;

  final String title;
  final bool automaticallyImplyLeading;

  final List<Widget>? actions;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      primary: primary,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
