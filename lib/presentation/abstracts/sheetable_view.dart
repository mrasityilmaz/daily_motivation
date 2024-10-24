import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/presentation/sheets/app_sheets.dart';

/// This class using a different way to handle the sheets.
/// Because of, I wanna use the sheets as a route, as a sheet, etc.
/// When extending this class, you need to decide the `primary` parameter default value in the constructor.
abstract class StatelessSheetableWidget extends StatelessWidget implements _SheetableInterface {
  const StatelessSheetableWidget({required this.primary, super.key});

  /// This decide this View showing as a primary view or sheet view
  final bool primary;
}

/// When extending this class, you need to decide the `primary` parameter default value in the constructor.
abstract class StatefulSheetableWidget extends StatefulWidget implements _SheetableInterface {
  const StatefulSheetableWidget({required this.primary, super.key});

  /// This decide this View showing as a primary view or sheet view
  final bool primary;
}

abstract interface class _SheetableInterface {
  const _SheetableInterface();

  /// Create a sheet instance.
  /// It's using for show the modal bottom sheet or Create a sheet route.
  Sheets createSheetInstance() {
    throw UnimplementedError();
  }

  /// Show Modal Bottom Sheet
  /// Need a `Sheets` instance to show the modal bottom sheet.
  Future<T?> showAsModalBottomSheet<T>(BuildContext context) {
    throw UnimplementedError();
  }

  /// Create a sheet route.
  /// Need a `Sheets` instance to create a sheet route.
  ///
  /// Ignore the `page` parameter.
  ///
  /// Ignore the `child` parameter.
  ///
  ModalSheetRoute<T> createSheetRoute<T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
    throw UnimplementedError();
  }
}
