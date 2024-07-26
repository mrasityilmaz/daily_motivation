import 'package:flutter/material.dart';

@immutable
final class BounceAnimation extends StatefulWidget {
  const BounceAnimation({super.key, this.child});

  final Widget? child;

  @override
  BounceAnimationState createState() => BounceAnimationState();
}

class BounceAnimationState extends State<BounceAnimation> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _animate;

  @override
  void initState() {
    _animate = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(
        milliseconds: 100,
      ),
      upperBound: 0.03,
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

  Future<void> startAnimation({required Future<void> Function() callback}) async {
    await _animate.forward();
    await _animate.reverse();
    await callback();
  }
}
