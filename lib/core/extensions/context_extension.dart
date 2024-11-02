import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotely/shared/app_theme.dart';
import 'package:quotely/shared/theme/color_scheme.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtensionn on BuildContext {
  ThemeData get theme => Theme.of(this).copyWith(extensions: Theme.of(this).extensions.values);
  SignViewTheme get signViewTheme => theme.extension<SignViewTheme>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;
  AppColorScheme get appColors => AppColorScheme.instance;

  Color getXorColor(Color color) => _adjustColorBasedOnIntensity(color);
}

extension Themmeee on ThemeData {
  Iterable<ThemeExtension<dynamic>> get extensions => <ThemeExtension<dynamic>>[signViewTheme];

  SignViewTheme get signViewTheme => extension<SignViewTheme>()!;
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

Color _adjustColorBasedOnIntensity(Color originalColor) {
  // Renk değerini yoğunluğa (luminance) göre kontrol et
  final double intensity = originalColor.computeLuminance();

  // Belirli bir eşik değeri ile karşılaştır
  const double threshold = 0.49;

  // Eğer yoğunluk eşik değerinden küçükse (siyah tonlarına yakın),
  // beyazımsı bir renge çevir, değilse tam tersini yap
  return intensity < threshold ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
}
