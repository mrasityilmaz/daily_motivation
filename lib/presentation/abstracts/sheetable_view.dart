import 'package:flutter/widgets.dart';

/// This class using a different way to handle the sheets.
/// Because of, I wanna use the sheets as a route, as a sheet, etc.
/// When extending this class, you need to decide the `primary` parameter default value in the constructor.
abstract class StatelessSheetableWidget extends StatelessWidget implements _SheetableInterface {
  const StatelessSheetableWidget({required this.primary, super.key});

  /// This decide this View showing as a primary view or sheet view
  @override
  final bool primary;
}

/// When extending this class, you need to decide the `primary` parameter default value in the constructor.
abstract class StatefulSheetableWidget extends StatefulWidget implements _SheetableInterface {
  const StatefulSheetableWidget({required this.primary, super.key});

  /// This decide this View showing as a primary view or sheet view
  @override
  final bool primary;
}

abstract interface class _SheetableInterface {
  const _SheetableInterface({required this.primary});

  final bool primary;

  /// Show Modal Bottom Sheet
  /// Need a `Sheets` instance to show the modal bottom sheet.
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) {
    assert(primary, 'showAsModalBottomSheet only works with non-primary views\nTry again with `primary = false`');
    throw UnimplementedError();
  }
}
