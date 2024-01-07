import 'package:flutter/material.dart';

@immutable
final class BounceAnimation extends StatefulWidget {
  const BounceAnimation({super.key, this.child, this.duration});

  final Widget? child;
  final Duration? duration;

  @override
  BounceAnimationState createState() => BounceAnimationState();
}

class BounceAnimationState extends State<BounceAnimation> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _animate;

  Duration get userDuration => widget.duration ?? const Duration(milliseconds: 100);

  @override
  void initState() {
    _animate = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return Transform.scale(
      scale: _scale,
      child: widget.child,
    );
  }

  void startAnimation() {
    _animate.forward();
    Future.delayed(userDuration, () {
      _animate.reverse();
    });
  }
}
