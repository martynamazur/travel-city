import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSurface,
  ),
);

final darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    foregroundColor: darkColorScheme.onSurface,
  ),
);


final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3F51B5),
  onPrimary: Colors.white,
  secondary: Color(0xFF00BCD4),
  onSecondary: Colors.black,
  surface: Colors.white,
  onSurface: Color(0xFF212121),
  error: Color(0xFFD32F2F),
  onError: Colors.white,
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7986CB),
  onPrimary: Colors.black,
  secondary: Color(0xFF4DD0E1),
  onSecondary: Colors.black,
  surface: Color(0xFF1E1E1E),
  onSurface: Color(0xFFE0E0E0),
  error: Color(0xFFEF5350),
  onError: Colors.black,
);
