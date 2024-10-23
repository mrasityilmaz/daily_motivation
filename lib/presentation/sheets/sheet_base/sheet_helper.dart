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
      child: child,
    );

    if (shape is RoundedRectangleBorder) {
      innerChild = ClipRRect(
        borderRadius: (shape as RoundedRectangleBorder).borderRadius,
        child: innerChild,
      );
    }

    return innerChild;
  }

  /// It's using in the [showMaterialModalBottomSheet] method.
  /// I stole this method from the source code of package to create my custom sheet route creator.
  WidgetWithChildBuilder _materialContainerBuilder(
    BuildContext context, {
    Color? backgroundColor,
    double? elevation,
    ThemeData? theme,
    Clip? clipBehavior,
    ShapeBorder? shape,
  }) {
    final bottomSheetTheme = Theme.of(context).bottomSheetTheme;
    final color = backgroundColor ?? bottomSheetTheme.modalBackgroundColor ?? bottomSheetTheme.backgroundColor;
    final effectiveElevation = elevation ?? bottomSheetTheme.elevation ?? 0.0;
    final effectiveShape = shape ?? bottomSheetTheme.shape;
    final effectiveClipBehavior = clipBehavior ?? bottomSheetTheme.clipBehavior ?? Clip.none;

    Widget result(context, animation, Widget child) => Material(
          color: color,
          elevation: effectiveElevation,
          shape: effectiveShape,
          clipBehavior: effectiveClipBehavior,
          child: child,
        );
    if (theme != null) {
      return (context, animation, child) => Theme(data: theme, child: result(context, animation, child));
    } else {
      return result;
    }
  }
}
