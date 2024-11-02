import 'dart:io';

import 'package:flutter/material.dart';

extension TextAlignExtension on TextAlign {
  IconData get icon {
    switch (this) {
      case TextAlign.center:
        return Platform.isAndroid ? Icons.format_align_center : Icons.format_align_center_outlined;
      case TextAlign.end:
        return Platform.isAndroid ? Icons.format_align_right : Icons.format_align_right_outlined;
      case TextAlign.justify:
        return Platform.isAndroid ? Icons.format_align_justify : Icons.format_align_justify_outlined;
      case TextAlign.left:
        return Platform.isAndroid ? Icons.format_align_left : Icons.format_align_left_outlined;
      case TextAlign.right:
        return Platform.isAndroid ? Icons.format_align_right : Icons.format_align_right_outlined;
      case TextAlign.start:
        return Platform.isAndroid ? Icons.format_align_left : Icons.format_align_left_outlined;
    }
  }

  Alignment get toAlignment {
    switch (this) {
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.end:
        return Alignment.centerRight;
      case TextAlign.justify:
        return Alignment.center;
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.right:
        return Alignment.centerRight;
      case TextAlign.start:
        return Alignment.centerLeft;
    }
  }
}
