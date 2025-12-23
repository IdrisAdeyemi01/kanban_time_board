import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF95D44),
    onPrimary: Colors.white,

    secondary: Color(0xFF2F8F9D),
    onSecondary: Colors.white,

    error: Color(0xFFD32F2F),
    onError: Colors.white,

    surface: Color(0xFFF9FAFB),
    onSurface: Color(0xFF1F2933),
  ),

  scaffoldBackgroundColor: const Color(0xFFF9FAFB),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF95D44),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFF95D44),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFF95D44),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFF95D44),
    foregroundColor: Colors.white,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFF95D44), width: 2),
    ),
  ),

  // Text
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1F2933),
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1F2933),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF374151)),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
  ),

  // Divider
  dividerTheme: const DividerThemeData(color: Color(0xFFE5E7EB), thickness: 1),
);
