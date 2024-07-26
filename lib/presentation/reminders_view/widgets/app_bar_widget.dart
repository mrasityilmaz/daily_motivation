part of '../reminders_view.dart';

@immutable
final class _AppBarWidget extends ViewModelWidget<_RemindersViewModel> implements PreferredSizeWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context, _RemindersViewModel viewModel) {
    return AppBar(
      backgroundColor: context.colors.surface,
      title: Text(
        'Reminders',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      forceMaterialTransparency: false,
      actions: [
        if (!viewModel.hasReachedMaxReminderCount) ...[
          Padding(
            padding: context.screenPaddingRight * .5,
            child: AdvancedButtonWidget.icon(
              backgroundColor: context.colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: context.radius8,
                side: BorderSide(
                  color: context.colors.primary,
                  width: 2,
                ),
              ),
              icon: Badge(
                label: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.surface,
                  ),
                  child: Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 14,
                    color: context.colors.primary,
                  ),
                ),
                offset: const Offset(4, -1.5),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                  color: context.colors.primary,
                ),
              ),
              onPressed: viewModel.onTapAddNewReminder,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
