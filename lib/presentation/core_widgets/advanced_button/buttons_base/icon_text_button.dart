part of '../advanced_button_widget.dart';

@immutable
final class _IconTextButton extends StatelessWidget {
  const _IconTextButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.textColor,
    this.textStyle,
    this.expand = false,
    this.bounceIt = false,
  });

  final Widget icon;
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final bool bounceIt;

  final EdgeInsetsGeometry? padding;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<BounceAnimationState> animate = GlobalKey<BounceAnimationState>();
    return BounceAnimation(
      key: animate,
      child: TextButton.icon(
        icon: icon,
        label: Text(
          text,
          style: textStyle?.copyWith(color: textColor ?? context.colors.onPrimary) ?? context.textTheme.bodyMedium?.copyWith(color: textColor ?? context.colors.onPrimary),
        ),
        onPressed: onPressed != null
            ? () async {
                if (bounceIt) {
                  try {
                    await animate.currentState?.startAnimation(callback: () async => onPressed!.call());
                  } catch (e) {}
                } else {
                  onPressed!.call();
                }
              }
            : null,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? context.colors.primary,
          shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius12),
          minimumSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
          fixedSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
          padding: padding,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        ),
      ),
    );
  }
}
