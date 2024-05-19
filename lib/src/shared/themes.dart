import 'package:flutter/material.dart';
import 'colors.dart';

final themeLight = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    background: backgroundColor,
    onBackground: onBackgroundColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: onPrimaryColor,
    titleTextStyle: TextStyle(
        color: onSurfaceColor, fontWeight: FontWeight.bold, fontSize: 18),
  ),
);

final themeDark = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: primaryColorDark,
    onPrimary: onPrimaryColorDark,
    secondary: secondaryColorDark,
    onSecondary: onSecondaryColorDark,
    background: backgroundColorDark,
    onBackground: onBackgroundColorDark,
    surface: surfaceColorDark,
    onSurface: onSurfaceColorDark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColorDark,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
        color: onSurfaceColor, fontWeight: FontWeight.bold, fontSize: 18),
  ),
);

