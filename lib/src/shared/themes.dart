import 'package:flutter/material.dart';

import 'colors.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: onPrimaryColor,
    titleTextStyle: TextStyle(
        color: onSurfaceColor, fontWeight: FontWeight.bold, fontSize: 18),
  ),
);
