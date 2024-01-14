part of 'theme_configuration_service.dart';

mixin _ThemeConfigurationserviceMixin {
  final String allBackgroundsPath = 'assets/backgrounds/';
  String get defaultBackgroundPath => '${allBackgroundsPath}1.webp';
  DefaultFontsEnum get defaultFont => DefaultFontsEnum.plusJakartaSans;

  final List<String> allBackgroundList = List.generate(124, (index) => 'assets/backgrounds/${index + 1}.webp')
    ..sort(
      (a, b) => a.compareTo(b),
    );

  final List<DefaultFontsEnum> defaultFontList = DefaultFontsEnum.values.map((e) => e).toList()..sort((a, b) => a.fontFamily.compareTo(b.fontFamily));

//   final List<String> googleFontList = GoogleFonts.asMap().keys.toList()..toList();
}
