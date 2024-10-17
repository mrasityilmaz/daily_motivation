part of '../../app_theme.dart';

mixin _AppLightTheme {
  // Tek bir yerde GoogleFonts oluşturma
  final _montserratFont = GoogleFonts.montserrat();
  final _plusJakartaFont = GoogleFonts.plusJakartaSansTextTheme();

  ColorScheme get lightColorScheme => ColorScheme.light(
        surface: AppColorScheme.instance.backgroundColor,
        onSurface: AppColorScheme.instance.blackColor,
        onPrimary: AppColorScheme.instance.backgroundColor,
        primary: AppColorScheme.instance.primaryColor,
        shadow: AppColorScheme.instance.blackColor.withOpacity(.1),
      );

  TextTheme get lightTextTheme => _plusJakartaFont.apply(
        displayColor: lightColorScheme.onSurface,
        bodyColor: lightColorScheme.onSurface,
        decorationColor: lightColorScheme.onSurface,
      );

  ThemeData get lightThemeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: lightColorScheme,
        textTheme: lightTextTheme,
        fontFamily: _montserratFont.fontFamily,
        scaffoldBackgroundColor: lightColorScheme.surface,
        primaryColor: lightColorScheme.primary,
        iconTheme: IconThemeData(color: lightColorScheme.onSurface),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: lightTextTheme.labelSmall,
          fillColor: lightColorScheme.surface,
        ),
        bottomNavigationBarTheme: _buildBottomNavBarTheme(),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: lightColorScheme.surface,
        ),
        tabBarTheme: _buildTabBarTheme(),
        chipTheme: _buildChipTheme(),
        dividerTheme: DividerThemeData(
          color: lightColorScheme.onSurface.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: lightColorScheme.onSurface.withOpacity(.2),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: lightColorScheme.surface.withOpacity(.1),
          surfaceTintColor: Colors.amber,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: lightColorScheme.primary,
          refreshBackgroundColor: lightColorScheme.surface,
        ),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: lightColorScheme.onSurface.withOpacity(.5),
          backgroundColor: lightColorScheme.surface,
          surfaceTintColor: lightColorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.surface,
          iconTheme: IconThemeData(color: lightColorScheme.onSurface),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        extensions: [
          SignViewTheme(
            firstPrimary: AppColorScheme.instance.primarySwatch.shade500,
            secondPrimary: AppColorScheme.instance.primarySwatch.shade400,
            thirdPrimary: AppColorScheme.instance.primarySwatch.shade300,
          ),
        ],
      );

  // BottomNavigationBarThemeData
  BottomNavigationBarThemeData _buildBottomNavBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.surface.withOpacity(.9),
      selectedItemColor: lightColorScheme.primary,
    );
  }

  // TabBarTheme
  TabBarTheme _buildTabBarTheme() {
    return TabBarTheme(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicatorColor: lightColorScheme.primary,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  // ChipThemeData
  ChipThemeData _buildChipTheme() {
    return ChipThemeData(
      brightness: Brightness.light,
      selectedColor: lightColorScheme.primary,
      backgroundColor: lightColorScheme.surface,
      side: BorderSide(color: lightColorScheme.primary, width: .7),
      labelStyle: _montserratFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: lightColorScheme.primary,
      ),
    );
  }
}
