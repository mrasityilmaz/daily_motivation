part of '../app_theme.dart';

sealed class _AppTheme {
  TextTheme get textTheme;
  ColorScheme get colorScheme;
}

final class _AppDarkTheme implements _AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        background: AppColorScheme.instance.blackColor,
        onBackground: AppColorScheme.instance.greyColor,
        onPrimary: Colors.white,
        primary: AppColorScheme.instance.primaryColor,
      );

  @override
  TextTheme get textTheme => GoogleFonts.plusJakartaSansTextTheme().apply(
        displayColor: colorScheme.onBackground,
        bodyColor: colorScheme.onBackground,
        decorationColor: colorScheme.onBackground,
      );

  ThemeData get themeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.background,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.background.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.surface,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.dark,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.background,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.primary),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.background.withOpacity(.1), surfaceTintColor: Colors.amber),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onBackground.withOpacity(.5),
          backgroundColor: colorScheme.background,
          surfaceTintColor: colorScheme.onBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          iconTheme: IconThemeData(color: colorScheme.onBackground),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onBackground.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onBackground.withOpacity(.2),
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
        background: AppColorScheme.instance.backgroundColor,
        onBackground: AppColorScheme.instance.blackColor,
        onPrimary: AppColorScheme.instance.backgroundColor,
        primary: AppColorScheme.instance.primaryColor,
      );

  @override
  TextTheme get textTheme => GoogleFonts.plusJakartaSansTextTheme().apply(
        displayColor: colorScheme.onBackground,
        bodyColor: colorScheme.onBackground,
        decorationColor: colorScheme.onBackground,
      );

  ThemeData get themeData => ThemeData(
        primarySwatch: AppColorScheme.instance.primarySwatch,
        colorScheme: colorScheme,
        textTheme: textTheme,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: colorScheme.background,
        primaryColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.labelSmall,
          fillColor: colorScheme.background,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorScheme.background.withOpacity(.9),
          selectedItemColor: colorScheme.primary,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colorScheme.background,
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicatorColor: colorScheme.primary,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          selectedColor: colorScheme.primary,
          backgroundColor: colorScheme.background,
          side: BorderSide(color: colorScheme.primary, width: .7),
          labelStyle: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.primary),
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onBackground.withOpacity(.2),
          thickness: .3,
        ),
        dividerColor: colorScheme.onBackground.withOpacity(.2),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        popupMenuTheme: PopupMenuThemeData(color: colorScheme.background.withOpacity(.1), surfaceTintColor: Colors.amber),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: colorScheme.primary, refreshBackgroundColor: colorScheme.background),
        drawerTheme: DrawerThemeData(
          elevation: 0,
          shadowColor: colorScheme.onBackground.withOpacity(.5),
          backgroundColor: colorScheme.background,
          surfaceTintColor: colorScheme.onBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          iconTheme: IconThemeData(color: colorScheme.onBackground),
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
