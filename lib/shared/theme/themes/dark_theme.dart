part of '../../app_theme.dart';

mixin _AppDarkTheme {
  // Tek bir yerde GoogleFonts oluşturma
  final _montserratFont = GoogleFonts.montserrat();
  final _plusJakartaFont = GoogleFonts.plusJakartaSansTextTheme();

  ColorScheme get darkColorScheme => ColorScheme.dark(
        surface: AppColorScheme.instance.blackColor,
        onSurface: AppColorScheme.instance.lightGreyColor,
        onPrimary: Colors.white,
        primary: AppColorScheme.instance.primaryColor,
        shadow: AppColorScheme.instance.blackColor.withOpacity(.1),
      );

  TextTheme get darkTextTheme => _plusJakartaFont.apply(
        displayColor: darkColorScheme.onSurface,
        bodyColor: darkColorScheme.onSurface,
        decorationColor: darkColorScheme.onSurface,
      );

  ThemeData get darkThemeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: darkColorScheme,
        textTheme: darkTextTheme,
        fontFamily: _montserratFont.fontFamily,
        scaffoldBackgroundColor: darkColorScheme.surface,
        primaryColor: darkColorScheme.primary,
        iconTheme: IconThemeData(color: darkColorScheme.onSurface),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: darkTextTheme.labelSmall,
          fillColor: darkColorScheme.surface,
        ),
        bottomNavigationBarTheme: _buildBottomNavBarTheme(),
        tabBarTheme: _buildTabBarTheme(),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: darkColorScheme.surface,
        ),
        chipTheme: _buildChipTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: darkColorScheme.surface.withOpacity(.1),
          surfaceTintColor: Colors.amber,
        ),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: darkColorScheme.onSurface.withOpacity(.5),
          backgroundColor: darkColorScheme.surface,
          surfaceTintColor: darkColorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkColorScheme.surface,
          iconTheme: IconThemeData(color: darkColorScheme.onSurface),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: DividerThemeData(
          color: darkColorScheme.onSurface.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: darkColorScheme.onSurface.withOpacity(.2),
        extensions: const [],
      );

  // BottomNavigationBarThemeData
  BottomNavigationBarThemeData _buildBottomNavBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface.withOpacity(.9),
      selectedItemColor: darkColorScheme.primary,
    );
  }

  // TabBarTheme
  TabBarTheme _buildTabBarTheme() {
    return TabBarTheme(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicatorColor: darkColorScheme.primary,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  // ChipThemeData
  ChipThemeData _buildChipTheme() {
    return ChipThemeData(
      brightness: Brightness.dark,
      selectedColor: darkColorScheme.primary,
      backgroundColor: darkColorScheme.surface,
      side: BorderSide(color: darkColorScheme.primary, width: .7),
      labelStyle: _montserratFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: darkColorScheme.primary,
      ),
    );
  }
}
