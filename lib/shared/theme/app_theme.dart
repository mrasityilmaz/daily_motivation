part of '../app_theme.dart';

sealed class _AppTheme {
  TextTheme get textTheme;
  ColorScheme get colorScheme;
}

final class _AppDarkTheme implements _AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        surface: AppColorScheme.instance.blackColor,
        onSurface: AppColorScheme.instance.lightGreyColor,
        onPrimary: Colors.white,
        primary: AppColorScheme.instance.primaryColor,
        shadow: AppColorScheme.instance.blackColor.withOpacity(.1),
      );

  @override
  TextTheme get textTheme => GoogleFonts.plusJakartaSansTextTheme().apply(
        displayColor: colorScheme.onSurface,
        bodyColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      );

  ThemeData get themeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: colorScheme.surface,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.surface,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.surface.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.surface,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.dark,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.surface,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.primary),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.surface.withOpacity(.1), surfaceTintColor: Colors.amber),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onSurface.withOpacity(.5),
          backgroundColor: colorScheme.surface,
          surfaceTintColor: colorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          iconTheme: IconThemeData(color: colorScheme.onSurface),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onSurface.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onSurface.withOpacity(.2),
        extensions: [
          SignViewTheme(
            firstPrimary: AppColorScheme.instance.primarySwatch.shade700,
            secondPrimary: AppColorScheme.instance.primarySwatch.shade800,
            thirdPrimary: AppColorScheme.instance.primarySwatch.shade900,
          ),
        ],
      );
}

final class _AppLightTheme implements _AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.light(
        surface: AppColorScheme.instance.backgroundColor,
        onSurface: AppColorScheme.instance.blackColor,
        onPrimary: AppColorScheme.instance.backgroundColor,
        primary: AppColorScheme.instance.primaryColor,
        shadow: AppColorScheme.instance.blackColor.withOpacity(.1),
      );

  @override
  TextTheme get textTheme => GoogleFonts.plusJakartaSansTextTheme().apply(
        displayColor: colorScheme.onSurface,
        bodyColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      );

  ThemeData get themeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: colorScheme.surface,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.surface,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.surface.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.surface,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.surface,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.primary),
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onSurface.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onSurface.withOpacity(.2),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.surface.withOpacity(.1), surfaceTintColor: Colors.amber),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: colorScheme.primary, refreshBackgroundColor: colorScheme.surface),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onSurface.withOpacity(.5),
          backgroundColor: colorScheme.surface,
          surfaceTintColor: colorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          iconTheme: IconThemeData(color: colorScheme.onSurface),
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
}
