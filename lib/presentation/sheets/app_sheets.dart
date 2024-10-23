import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';

part 'sheet_base/i_app_sheets.dart';
part 'sheet_base/sheet_helper.dart';

/// This class using a different way to handle the sheets.
/// Because of, I wanna use the sheets as a route.
/// So, I created this class to handle the sheets as a route, sheet, etc.
///
@immutable
final class Sheets extends _IBaseSheets with _SheetBuilderHelper {
  const Sheets({
    required super.child,
    super.isDismissible = true,
    super.enableDrag = true,
    super.useRootNavigator = false,
    super.bounce = true,
    super.expand = false,
    super.animationCurve = Curves.fastLinearToSlowEaseIn,
    super.duration = const Duration(milliseconds: 250),
    super.backgroundColor,
    super.elevation,
    super.shape = const RoundedRectangleBorder(
      borderRadius: RadiusConstants.highTop(),
    ),
    super.clipBehavior,
    super.barrierColor,
    super.secondAnimation,
    super.settings,
    super.closeProgressThreshold,
    super.constraints,
  });

  /// Basicly, this method is using for show a bottom sheet.
  @override
  Future<T?> showBottomSheet<T>(BuildContext context) async {
    return showMaterialModalBottomSheet<T>(
      context: context,
      builder: builderWithChildForSheet,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor ?? context.colors.scrim.withOpacity(0.5),
      bounce: bounce,
      expand: expand,
      secondAnimation: secondAnimation,
      animationCurve: animationCurve,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      duration: duration,
      settings: settings,
      closeProgressThreshold: closeProgressThreshold,
    );
  }

  /// This method is using for create the sheet route.
  /// It's required if you want to navigate to the sheet as a route.
  @override
  ModalSheetRoute<T> createSheetRoute<T>(BuildContext context) {
    return ModalSheetRoute<T>(
      builder: builderWithChildForSheet,
      closeProgressThreshold: closeProgressThreshold,
      containerBuilder: _materialContainerBuilder(
        context,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        theme: Theme.of(context),
      ),
      secondAnimationController: secondAnimation,
      bounce: bounce,
      expanded: expand,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      animationCurve: animationCurve,
      duration: duration,
      settings: settings,
    );
  }
}
