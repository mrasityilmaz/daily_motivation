part of '../advanced_button_widget.dart';

@immutable
final class _TextButton extends StatelessWidget {
  const _TextButton({
    required this.text,
    required this.textColor,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.expand = false,
    this.bounceIt = false,
  });

  final String text;
  final Color? textColor;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool expand;
  final bool bounceIt;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<BounceAnimationState> animate = GlobalKey<BounceAnimationState>();
    return BounceAnimation(
      key: animate,
      child: TextButton(
        onPressed: onPressed != null
            ? () async {
                if (bounceIt) {
                  try {
                    await animate.currentState?.startAnimation(callback: () async => onPressed!.call());
                  } catch (e, s) {
                    LoggerService.instance.catchLog(e, s);
                  }
                } else {
                  onPressed!.call();
                }
              }
            : null,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? context.colors.primary,
          minimumSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
          fixedSize: expand ? const Size(double.infinity, kMinInteractiveDimension) : null,
          shape: shape ?? RoundedRectangleBorder(borderRadius: context.radius12),
          padding: padding,
          elevation: 0,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        ),
        child: Text(
          text,
          style: textStyle?.copyWith(color: textColor ?? context.colors.onPrimary) ?? context.textTheme.bodyMedium?.copyWith(color: textColor ?? context.colors.onPrimary),
        ),
      ),
    );
  }
}
