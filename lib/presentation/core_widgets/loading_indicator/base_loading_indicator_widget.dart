import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';

///
/// [progressWidget] is the widget that will be shown when the viewmodel is busy.
/// Default is [CircularProgressIndicator.adaptive].
///
/// [hasBackgroundColor] is a boolean that determines whether the loading indicator has a background color.
/// Default is `true`.
///
/// [BaseLoadingIndicator] has a blurred background effect as default.
///
final class BaseLoadingIndicator extends StatelessWidget {
  const BaseLoadingIndicator({super.key, this.progressWidget, this.hasBackgroundColor = true});

  final Widget? progressWidget;
  final bool hasBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height,
      decoration: BoxDecoration(
        color: hasBackgroundColor ? context.colors.shadow.withOpacity(.3) : Colors.transparent,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: const ClipRRect(
          child: Center(
            child: SizedBox(
              height: kMinInteractiveDimension,
              width: kMinInteractiveDimension,
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
