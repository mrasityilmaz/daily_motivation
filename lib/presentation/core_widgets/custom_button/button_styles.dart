// Todo: Change the AppThemeManager usage
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/view_constants/radius_constants.dart';
import 'package:quotely/shared/app_theme.dart';

final class CustomButtonStyles extends ButtonStyle {
  CustomButtonStyles.standart({required this.expand})
      : super(
          elevation: cElevation,
          backgroundColor: cPrimaryBackgroundColor,
          minimumSize: expand ? cMinimumSize : cMiniSize,
          fixedSize: expand ? cFixedSize : null,
          padding: cStatePadding,
          shape: cStandartShape,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return AppThemeManager.instance.colorScheme.onSurface.withOpacity(.2);
            }
            return Colors.transparent;
          }),
        );

  CustomButtonStyles.outlined({required this.expand})
      : super(
          elevation: cElevation,
          backgroundColor: cOutlineBackgroundColor,
          minimumSize: expand ? cMinimumSize : cMiniSize,
          fixedSize: expand ? cFixedSize : null,
          padding: cStatePadding,
          shape: cOutlineShape,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        );

  final bool expand;

  static const WidgetStatePropertyAll<double> cElevation = WidgetStatePropertyAll(0);
  static WidgetStatePropertyAll<Color> cPrimaryBackgroundColor =
      WidgetStatePropertyAll(AppThemeManager.instance.colorScheme.primary);
  static WidgetStatePropertyAll<Color> cOutlineBackgroundColor =
      WidgetStatePropertyAll(AppThemeManager.instance.colorScheme.surface);

  static const WidgetStatePropertyAll<Size> cMinimumSize = WidgetStatePropertyAll(
    Size(double.infinity, kMinInteractiveDimension),
  );

  static const WidgetStatePropertyAll<Size> cMiniSize = WidgetStatePropertyAll(
    Size.square(kMinInteractiveDimensionCupertino),
  );

  static const WidgetStatePropertyAll<Size> cFixedSize = WidgetStatePropertyAll(
    Size(double.infinity, kMinInteractiveDimension),
  );

  static const WidgetStatePropertyAll<EdgeInsetsGeometry> cPadding = WidgetStatePropertyAll(
    PaddingConstants.allLow(),
  );

  static const WidgetStatePropertyAll<OutlinedBorder> cStandartShape = WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: RadiusConstants.allLow(),
    ),
  );
  static WidgetStatePropertyAll<OutlinedBorder> cOutlineShape = WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: const RadiusConstants.allLow(),
      side: BorderSide(color: AppThemeManager.instance.colorScheme.primary, width: 2),
    ),
  );

  static WidgetStateProperty<EdgeInsetsGeometry> get cStatePadding =>
      WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
        if (states.contains(WidgetState.pressed)) {
          return EdgeInsets.symmetric(
            horizontal: (cPadding.value * .95).horizontal / 2,
            vertical: (cPadding.value * .95).vertical / 2,
          );
        }
        return cPadding.value;
      });
}
