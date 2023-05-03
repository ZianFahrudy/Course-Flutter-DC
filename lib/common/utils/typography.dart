import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTypography {
  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 57,
    letterSpacing: -1.9,
  );

  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 45,
    letterSpacing: -1.3,
  );

  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 36,
    letterSpacing: -0.8,
  );

  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 32,
    letterSpacing: -0.8,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 28,
    letterSpacing: -0.8,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 24,
    letterSpacing: -0.6,
  );

  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 22,
    letterSpacing: -0.6,
  );

  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: -0.4,
  );

  static TextStyle titleSmall = GoogleFonts.poppins(
    fontSize: 14,
    letterSpacing: -0.2,
  );

  static TextStyle labelLarge = GoogleFonts.poppins(
    fontSize: 14,
    letterSpacing: -0.4,
  );

  static TextStyle labelMedium = GoogleFonts.poppins(
    fontSize: 12,
    letterSpacing: 0.1,
  );

  static TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 11,
    letterSpacing: 0.22,
  );

  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: -0.2,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    letterSpacing: -0.28,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    letterSpacing: -0.02,
  );

  static final textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
  );
}
