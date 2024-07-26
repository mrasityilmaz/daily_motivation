import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';

@immutable
final class SliverBottomSafeWidget extends StatelessWidget {
  const SliverBottomSafeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
      sliver: const SliverToBoxAdapter(
        child: SizedBox(),
      ),
    );
  }
}
