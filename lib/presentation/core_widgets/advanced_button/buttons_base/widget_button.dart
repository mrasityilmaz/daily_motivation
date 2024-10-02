part of '../advanced_button_widget.dart';

@immutable
final class _WidgetButton extends StatelessWidget {
  const _WidgetButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.expand = false,
    this.bounceIt = false,
  });

  final Widget child;

  final void Function()? onPressed;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  final EdgeInsetsGeometry? padding;
  final bool expand;
  final bool bounceIt;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<BounceAnimationState> animate = GlobalKey<BounceAnimationState>();
    return BounceAnimation(
      key: animate,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () async {
                if (bounceIt) {
                  try {
                    await animate.currentState?.startAnimation(callback: () async => onPressed!.call());
                  } catch (e, s) {
                    LoggerService.catchLog(e, s);
                  }
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
          elevation: 0,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        ),
        child: child,
      ),
    );
  }
}
