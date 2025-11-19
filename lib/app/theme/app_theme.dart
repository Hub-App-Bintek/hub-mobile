import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';

/// Centralized theme configuration for the PKP Hub application.
class AppTheme {
  AppTheme._();

  static final ColorScheme lightColorScheme =
      const ColorScheme.light(
        primary: AppColors.primaryDark,
        onPrimary: AppColors.white,
        secondary: AppColors.khaki,
        onSecondary: AppColors.neutralDarkest,
        error: AppColors.errorDark,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.neutralDarkest,
      ).copyWith(
        surfaceTint: AppColors.primaryDark,
        surfaceContainer: AppColors.inputSurface,
        outline: AppColors.inputBorder,
        outlineVariant: AppColors.inputBorder,
      );

  static final ColorScheme darkColorScheme =
      const ColorScheme.dark(
        primary: AppColors.primaryDark,
        onPrimary: AppColors.white,
        secondary: AppColors.khaki,
        onSecondary: AppColors.neutralDarkest,
        error: AppColors.error,
        onError: AppColors.neutralDarkest,
        surface: AppColors.neutralDarkest,
        onSurface: AppColors.neutralLightest,
      ).copyWith(
        surfaceTint: AppColors.primaryDark,
        surfaceContainer: AppColors.neutralDark,
        outline: AppColors.neutralMedium,
        outlineVariant: AppColors.neutralMediumDark,
      );

  static ThemeData get lightTheme {
    final baseTextTheme = GoogleFonts.interTextTheme();
    final appliedTextTheme = baseTextTheme.apply(
      bodyColor: lightColorScheme.onSurface,
      displayColor: lightColorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      textTheme: appliedTextTheme,
      fontFamily: GoogleFonts.inter().fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      cardColor: AppColors.inputSurface,
      // cardTheme: const CardTheme(
      //   color: AppColors.inputSurface,
      //   surfaceTintColor: Colors.transparent,
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDarkest,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.neutralLightAlt,
          disabledForegroundColor: AppColors.neutralMedium,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.krem,
          foregroundColor: AppColors.primaryDarkest,
          side: const BorderSide(color: AppColors.primaryDarkest),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.interTextTheme();
    final appliedTextTheme = baseTextTheme.apply(
      bodyColor: darkColorScheme.onSurface,
      displayColor: darkColorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      textTheme: appliedTextTheme,
      fontFamily: GoogleFonts.inter().fontFamily,
      scaffoldBackgroundColor: darkColorScheme.surface,
      cardColor: AppColors.neutralDark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.neutralDark,
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
