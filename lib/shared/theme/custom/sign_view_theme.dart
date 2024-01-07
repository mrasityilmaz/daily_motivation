part of '../../app_theme.dart';

@immutable
final class SignViewTheme extends ThemeExtension<SignViewTheme> {
  const SignViewTheme({
    required this.firstPrimary,
    required this.secondPrimary,
    required this.thirdPrimary,
  });

  final Color firstPrimary;
  final Color secondPrimary;
  final Color thirdPrimary;

  @override
  SignViewTheme copyWith({
    Color? firstPrimary,
    Color? secondPrimary,
    Color? thirdPrimary,
  }) {
    return SignViewTheme(
      firstPrimary: firstPrimary ?? this.firstPrimary,
      secondPrimary: secondPrimary ?? this.secondPrimary,
      thirdPrimary: thirdPrimary ?? this.thirdPrimary,
    );
  }

  @override
  SignViewTheme lerp(ThemeExtension<SignViewTheme>? other, double t) {
    if (other is! SignViewTheme) {
      return this;
    }
    return SignViewTheme(
      firstPrimary: Color.lerp(firstPrimary, other.firstPrimary, t)!,
      secondPrimary: Color.lerp(secondPrimary, other.secondPrimary, t)!,
      thirdPrimary: Color.lerp(thirdPrimary, other.thirdPrimary, t)!,
    );
  }

  @override
  String toString() => 'SignViewTheme('
      'firstPrimary: $firstPrimary, '
      'secondPrimary: $secondPrimary, '
      'thirdPrimary: $thirdPrimary, '
      ')';
}
