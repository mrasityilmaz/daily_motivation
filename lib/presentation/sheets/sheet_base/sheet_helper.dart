part of '../app_sheets.dart';

@immutable
mixin _SheetBuilderHelper on _IBaseSheets {
  /// This method is using for create the pre-conditional widgets for the sheet.
  @override
  @protected
  Widget builderWithChildForSheet(BuildContext context) {
//     assert(expand == true && constraints == null, 'You can not use the constraints with expand property.');
    late Widget innerChild;

    innerChild = ConstrainedBox(
      constraints: expand
          ? const BoxConstraints()
          : constraints ??
              BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height - MediaQuery.viewPaddingOf(context).top),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) ...[
            const SheetDragHandle(),
          ],
          Flexible(child: child),
        ],
      ),
    );

    if (shape is RoundedRectangleBorder) {
      innerChild = ClipRRect(
        borderRadius: (shape as RoundedRectangleBorder).borderRadius,
        child: innerChild,
      );
    }

    return innerChild;
  }
}
