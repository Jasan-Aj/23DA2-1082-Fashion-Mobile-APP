import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFFFDF8F8);
  static const Color primary = Color(0xFF000000);
  static const Color onPrimary = Colors.white;
  static const Color secondaryContainer = Color(0xFFE4DFF7);
  static const Color surfaceVariant = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFF444748);
  static const Color surface = Color(0x66FFFFFF); // Semi-transparent for glass
  static const Color outline = Color(0x331A1A1A);
  static const Color error = Color(0xFFBA1A1A);
  
  static const LinearGradient iridescent = LinearGradient(
    colors: [Color(0xFF22D3EE), Color(0xFFD946EF), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient etherealBackground = RadialGradient(
    center: Alignment(-0.6, -0.6),
    radius: 1.5,
    colors: [Color(0xFFFDF8F8), Color(0xFFF1EDEC), Color(0xFFE4DFF7)],
    stops: [0.0, 0.5, 1.0],
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surface: AppColors.background,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        error: AppColors.error,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.notoSerif(
          fontSize: 80,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.02,
        ),
        headlineLarge: GoogleFonts.notoSerif(
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.notoSerif(
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}
