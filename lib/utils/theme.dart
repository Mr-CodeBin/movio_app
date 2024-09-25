import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFF720714);
  static const Color accentRed = Color(0xFFFF5252);
  static const Color darkGrey = Color(0xFF191515);
  static const Color lightGrey = Color(0xFFBDBDBD);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryRed,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'UbFont',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: darkGrey),
      bodyLarge: TextStyle(fontSize: 16.0, color: darkGrey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryRed,
      titleTextStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryRed,
      unselectedItemColor: lightGrey,
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryRed,
      secondary: accentRed,
      surface: Colors.white,
      background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkGrey,
      onBackground: darkGrey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryRed,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkGrey,
    fontFamily: 'UbFont',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.0, color: lightGrey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentRed,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: ThemeData.dark().textTheme.titleLarge?.copyWith(
            color: primaryRed,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: accentRed,
      unselectedItemColor: lightGrey,
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryRed,
      secondary: accentRed,
      surface: darkGrey,
      background: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
  );
}
