import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Raleway',
  colorScheme: const ColorScheme.light(
    inversePrimary: Colors.white,
    primary: Color(0xFF171717),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF2B2B2B),
    tertiary: Color(0xFF70757F),
    surface: Color(0xFFF4F4F4),
    onTertiary: Color(0XFFD9D9D9),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Raleway',
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Color(0xFF70757F),
    selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500, fontSize: 10, color: Colors.black),
    unselectedLabelStyle: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF70757F)),
  ),
);
