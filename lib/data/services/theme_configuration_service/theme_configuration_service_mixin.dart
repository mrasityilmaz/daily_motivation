part of 'theme_configuration_service.dart';

mixin _ThemeConfigurationserviceMixin {
  final String allBackgroundsPath = 'assets/backgrounds/';
  String get defaultBackgroundPath => '${allBackgroundsPath}1.webp';
  String get defaultFontName => 'Plus Jakarta Sans';

  final List<String> allBackgroundList = List.generate(124, (index) => 'assets/backgrounds/${index + 1}.webp')
    ..sort(
      (a, b) => a.compareTo(b),
    );

  final List<String> googleFontList = GoogleFonts.asMap().keys.toList()
    ..shuffle()
    ..toList();
}
