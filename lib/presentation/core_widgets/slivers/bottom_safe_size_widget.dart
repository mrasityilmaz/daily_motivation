import 'package:flutter/material.dart';

// TODO:
@immutable
final class SliverAdaptiveBottomSafeAreaWidget extends StatelessWidget {
  const SliverAdaptiveBottomSafeAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.viewPaddingOf(context).bottom,
      ),
    );
  }
}
