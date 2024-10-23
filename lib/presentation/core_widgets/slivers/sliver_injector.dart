import 'package:flutter/material.dart';

/// When a [SliverOverlapInjector] is placed in a [NestedScrollView], it allows
/// the inner scroll view and the outer scroll view to overlap each other.
/// Without this, the inner scroll view will get stuck at the top of the
/// outer scroll view.
///
/// Use this when you need a [SliverAppBar] to overlap with a [NestedScrollView].
///
/// Also, you have to wrap [SliverAppBar] with a [SliverOverlapAbsorber] and
/// handle the [SliverOverlapAbsorber.handle] property.
/// ```dart
/// handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
/// ```
@immutable
final class SliverInjector extends StatelessWidget {
  const SliverInjector({super.key});

  @override
  SliverOverlapInjector build(BuildContext context) {
    return SliverOverlapInjector(
      // This is the flip side of the SliverOverlapAbsorber
      // above.
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    );
  }
}
