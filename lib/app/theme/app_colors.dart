import 'package:flutter/material.dart';

/// A palette of colors that are used in the PKP Hub application.
class AppColors {
  AppColors._(); // This class is not meant to be instantiated.

  // --- Core Palette --- //

  // Primary (Highlight)
  static const Color primaryDarkest = Color(0xFF006FFD); // D66FFD
  static const Color primaryDark = Color(0xFF2887FF); // 2887FF
  static const Color primary = Color(0xFF6FB6FF); // 6FB6FF
  static const Color primaryLight = Color(0xFFB6D8FF); // B6D8FF
  static const Color primaryLightest = Color(0xFFEAF2FF); // EAF2FF

  // Neutral
  // Dark
  static const Color neutralDarkest = Color(0xFF1F2024); // 1F2024
  static const Color neutralDark = Color(0xFF2F3036); // 2F3036
  static const Color neutralMediumDark = Color(0xFF404A50); // 404A50
  static const Color neutralMedium = Color(0xFF71727A); // 71727A
  static const Color neutralMediumLight = Color(0xFFBFD0D8); // BFD0D8
  // Light
  static const Color neutralLight = Color(0xFFC5D6DD); // C5D6DD
  static const Color neutralLighter = Color(0xFFD4D6DD); // D4D6DD
  static const Color neutralLightAlt = Color(0xFFE0E0F1); // E0E0F1
  static const Color neutralLightest = Color(0xFFF8F9FE); // F8F9FE
  static const Color white = Color(0xFFFFFFFF); // FFFFFF

  // --- Support Palette --- //

  // Success
  static const Color successDark = Color(0xFF20B267); // 20B267
  static const Color success = Color(0xFF2ACDA0); // 2ACDA0
  static const Color successLight = Color(0xFFE7F8E8); // E7F8E8

  // Warning
  static const Color warningDark = Color(0xFFE88330); // E88330
  static const Color warning = Color(0xFFFFB37C); // FFB37C
  static const Color warningLight = Color(0xFFFFF4E4); // FFF4E4

  // Error
  static const Color errorDark = Color(0xFFED3241); // ED3241
  static const Color error = Color(0xFFFF618D); // FF618D
  static const Color errorLight = Color(0xFFFFF2F5); // FFF2F5
}
