import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF13EC5B),
        secondary: const Color(0xFFF29F05),
        surface: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF111813),
      ),
      scaffoldBackgroundColor: const Color(0xFFF6F8F6),
      textTheme: GoogleFonts.interTextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF13EC5B),
        secondary: const Color(0xFFF29F05),
        surface: const Color(0xFF1A3825),
        onSurface: const Color(0xFFF6F8F6),
      ),
      scaffoldBackgroundColor: const Color(0xFF102216),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    );
  }
}
