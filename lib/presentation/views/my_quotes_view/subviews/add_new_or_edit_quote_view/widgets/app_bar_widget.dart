part of '../add_new_or_edit_quote_view.dart';

@immutable
final class _AddNewOrEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AddNewOrEditAppBar({
    required this.editQuote,
  });

  final QuoteModel? editQuote;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        editQuote != null ? 'Edit Quote' : 'New Quote',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
