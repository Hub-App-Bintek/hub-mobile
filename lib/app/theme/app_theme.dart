import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';

/// Centralized theme configuration for the PKP Hub application.
class AppTheme {
  AppTheme._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryDarkest,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.neutralDarkest,
    secondary: AppColors.neutralMediumDark,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.neutralLightAlt,
    onSecondaryContainer: AppColors.neutralDarkest,
    tertiary: AppColors.successDark,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.successLight,
    onTertiaryContainer: AppColors.neutralDarkest,
    error: AppColors.errorDark,
    onError: AppColors.white,
    errorContainer: AppColors.errorLight,
    onErrorContainer: AppColors.neutralDarkest,
    surface: AppColors.neutralLightest,
    onSurface: AppColors.neutralDarkest,
    surfaceContainer: AppColors.neutralLightAlt,
    onSurfaceVariant: AppColors.neutralMediumDark,
    outline: AppColors.neutralLighter,
    outlineVariant: AppColors.neutralLight,
    shadow: AppColors.neutralDarkest,
    inverseSurface: AppColors.neutralDark,
    onInverseSurface: AppColors.neutralLightest,
    inversePrimary: AppColors.primaryDark,
    surfaceTint: AppColors.primaryDarkest,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryDarkest,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.neutralLight,
    onSecondary: AppColors.neutralDarkest,
    secondaryContainer: AppColors.neutralMediumDark,
    onSecondaryContainer: AppColors.neutralLightAlt,
    tertiary: AppColors.success,
    onTertiary: AppColors.neutralDarkest,
    tertiaryContainer: AppColors.successDark,
    onTertiaryContainer: AppColors.white,
    error: AppColors.error,
    onError: AppColors.neutralDarkest,
    errorContainer: AppColors.errorDark,
    onErrorContainer: AppColors.white,
    surface: AppColors.neutralDarkest,
    onSurface: AppColors.neutralLightest,
    surfaceContainer: AppColors.neutralDark,
    onSurfaceVariant: AppColors.neutralLight,
    outline: AppColors.neutralMedium,
    outlineVariant: AppColors.neutralMediumDark,
    shadow: AppColors.neutralDarkest,
    inverseSurface: AppColors.neutralLightest,
    onInverseSurface: AppColors.neutralDarkest,
    inversePrimary: AppColors.primaryDarkest,
    surfaceTint: AppColors.primaryDark,
  );

  static ThemeData get lightTheme => ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.neutralLight; // visually disabled color
          }
          return AppColors.primaryDarkest;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.neutralMedium; // visually disabled text color
          }
          return AppColors.white;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryDark;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primary;
          }
          return null;
        }),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        foregroundColor: WidgetStateProperty.all(AppColors.primaryDarkest),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.primaryDarkest),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryDark),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryDarkest;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primaryLight;
          }
          return null;
        }),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        foregroundColor: WidgetStateProperty.all(AppColors.primaryDark),
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.primaryDark),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}
