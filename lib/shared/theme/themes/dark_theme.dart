part of '../../app_theme.dart';

mixin _AppDarkTheme {
  ColorScheme get darkColorScheme => ColorScheme.dark(
        surface: AppColorScheme.instance.blackColor,
        onSurface: AppColorScheme.instance.lightGreyColor,
        onPrimary: Colors.white,
        primary: AppColorScheme.instance.primaryColor,
        shadow: AppColorScheme.instance.blackColor.withOpacity(.1),
      );

  TextTheme get darkTextTheme => GoogleFonts.plusJakartaSansTextTheme().apply(
        displayColor: darkColorScheme.onSurface,
        bodyColor: darkColorScheme.onSurface,
        decorationColor: darkColorScheme.onSurface,
      );

  ThemeData get darkThemeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: darkColorScheme,
        textTheme: darkTextTheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: darkColorScheme.surface,
        primaryColor: darkColorScheme.primary,
        iconTheme: IconThemeData(color: darkColorScheme.onSurface),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: darkTextTheme.labelSmall,
          fillColor: darkColorScheme.surface,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorScheme.surface.withOpacity(.9),
          selectedItemColor: darkColorScheme.primary,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: darkColorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: darkColorScheme.surface,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.dark,
          selectedColor: darkColorScheme.primary,
          backgroundColor: darkColorScheme.surface,
          side: BorderSide(color: darkColorScheme.primary, width: .7),
          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: darkColorScheme.primary),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
        ),
        popupMenuTheme:
            PopupMenuThemeData(color: darkColorScheme.surface.withOpacity(.1), surfaceTintColor: Colors.amber),
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
        extensions: [],
      );
}
