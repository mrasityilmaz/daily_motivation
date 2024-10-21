import 'package:flutter/material.dart';

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
