part of '../my_quotes_view.dart';

@immutable
final class _MyQuotesAppBar extends ViewModelWidget<MyQuotesViewModel> implements PreferredSizeWidget {
  const _MyQuotesAppBar() : super(reactive: false);

  @override
  AppBar build(BuildContext context, MyQuotesViewModel viewModel) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        'My Quotes',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const PaddingConstants.screenPaddingRight() * .5,
          child: AdvancedButtonWidget.icon(
            backgroundColor: context.colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: context.radius8,
              side: BorderSide(
                color: context.colors.primary,
                width: 2,
              ),
            ),
            icon: Icon(
              Icons.add_rounded,
              color: context.colors.primary,
            ),
            onPressed: () async => viewModel.onPressedAddMyQuoteButton(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
