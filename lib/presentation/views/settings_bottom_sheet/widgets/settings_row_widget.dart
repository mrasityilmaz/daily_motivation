part of '../settings_bottom_sheet.dart';

@immutable
final class _SettingsRowWidget extends StatelessWidget {
  const _SettingsRowWidget({required this.icon, required this.title, required this.onPressed, this.iconColor, this.trailing, this.iconPadding});

  final IconData icon;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final String title;
  final VoidCallback onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowBottom,
      child: AdvancedButtonWidget(
        backgroundColor: context.colors.surface,
        padding: context.paddingLowVertical * 1.2 + context.paddingLowHorizontal,
        onPressed: onPressed,
        child: Row(
          children: [
            Padding(
              padding: iconPadding ?? context.paddingLowTop * .5,
              child: Icon(
                icon,
                color: iconColor ?? context.colors.primary,
                size: 30,
              ),
            ),
            SizedBox(
              width: context.screenPadding.left,
            ),
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            if (trailing != null) ...[
              trailing!,
            ] else ...[
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: context.colors.onSurface.withOpacity(.3),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
