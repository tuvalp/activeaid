import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF7C4DFF),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF3F6FB),
    onSecondary: Color(0xFF9C9BC2),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFF3F6FB),
    onSurface: Color(0xFF000000),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF7C4DFF),
    elevation: 0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Color(0XFF9C9BC2),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
);
