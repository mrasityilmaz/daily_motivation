import 'package:flutter/material.dart';

final class SheetDragHandle extends StatelessWidget {
  const SheetDragHandle({
    super.key,
    this.handleSize,
    this.handleColor,
  });
  final Size? handleSize;
  final Color? handleColor;

  @override
  Widget build(BuildContext context) {
    final Size handleSizeSolv = handleSize ?? Theme.of(context).bottomSheetTheme.dragHandleSize ?? const Size(32, 4);
    final Color handleColorSolv =
        handleColor ?? Theme.of(context).bottomSheetTheme.dragHandleColor ?? Colors.grey[300]!;
    return SizedBox(
      width: kMinInteractiveDimension,
      height: kMinInteractiveDimension * .8,
      child: Align(
        alignment: const Alignment(0, .1),
        child: Container(
          height: handleSizeSolv.height,
          width: handleSizeSolv.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(handleSizeSolv.height / 2),
            color: handleColorSolv,
          ),
        ),
      ),
    );
  }
}
