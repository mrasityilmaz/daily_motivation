import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';

@immutable
final class SliverBottomSafeWidget extends StatelessWidget {
  const SliverBottomSafeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      minimum: PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom) +
          const PaddingConstants.mediumBottom(),
      sliver: const SliverToBoxAdapter(
        child: SizedBox(),
      ),
    );
  }
}
