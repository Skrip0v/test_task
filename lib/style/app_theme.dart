import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const primary = Color(0xFFA73AFD);
    const secondary = Color(0xFF65239F);
    const green = Color(0xFF5FA744);
    const text = Color(0xFF464646);
    const textLight = Color(0xFF8C8A8A);

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 24,
          color: text,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: text,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: textLight,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          color: textLight,
          fontWeight: FontWeight.normal,
          fontFamily: 'ABeeZee',
        ),
      ),
      colorScheme: const ColorScheme(
        primary: primary,
        onPrimary: text,
        secondary: secondary,
        onSecondary: text,
        primaryContainer: green,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onSurface: text,
        onBackground: text,
        onError: text,
        brightness: Brightness.light,
      ),
    );
  }
}
