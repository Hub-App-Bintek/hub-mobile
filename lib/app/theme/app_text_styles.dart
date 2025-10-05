
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A collection of text styles for the PKP Hub application, using the Inter font.
class AppTextStyles {
  AppTextStyles._(); // This class is not meant to be instantiated.

  static final String fontFamily = GoogleFonts.inter().fontFamily ?? 'Inter';

  // --- Heading --- //

  static final TextStyle h1 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w800, // ExtraBold
  );

  static final TextStyle h2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w800, // ExtraBold
  );

  static final TextStyle h3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w800, // ExtraBold
  );

  static final TextStyle h4 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700, // Bold
  );

  static final TextStyle h5 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w700, // Bold
  );

  // --- Body --- //

  static final TextStyle bodyXL = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle bodyL = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle bodyM = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle bodyS = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle bodyXS = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500, // Medium
  );

  // --- Action --- //

  static final TextStyle actionL = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600, // SemiBold
  );

  static final TextStyle actionM = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600, // SemiBold
  );

  static final TextStyle actionS = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600, // SemiBold
  );

  // --- Caption --- //
  
  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600, // SemiBold
  );

  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: h1,
      displayMedium: h2,
      displaySmall: h3,
      headlineLarge: h1,
      headlineMedium: h2,
      headlineSmall: h3,
      titleLarge: h4,
      titleMedium: h5,
      titleSmall: bodyXS.copyWith(fontWeight: FontWeight.w700),
      bodyLarge: bodyL,
      bodyMedium: bodyM,
      bodySmall: bodyS,
      labelLarge: actionL,
      labelMedium: actionM,
      labelSmall: actionS,
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}
