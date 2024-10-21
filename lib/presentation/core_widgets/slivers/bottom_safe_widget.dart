import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';

@immutable
final class SliverAdaptiveBottomSafeAreaWidget extends StatelessWidget {
  const SliverAdaptiveBottomSafeAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom) +
          const PaddingConstants.highBottom(),
      sliver: const SliverToBoxAdapter(
        child: SizedBox(),
      ),
    );
  }
}
