import 'package:flutter/material.dart';

/// A palette of colors that are used in the PKP Hub application.
class AppColors {
  AppColors._(); // This class is not meant to be instantiated.

  // --- Brand Palette --- //

  // Anchored to the provided palette chips.
  static const Color krem = Color(0xFFF2EEDF);
  static const Color khaki = Color(0xFFD5C58A);
  static const Color darkAqua = Color(0xFF0E5B73);
  static const Color midnightGreen = Color(0xFF084C61);

  // --- Core Palette --- //

  // Primary (Highlight)
  static const Color primaryDarkest = midnightGreen;
  static const Color primaryDark = darkAqua;
  static const Color primary = Color(0xFF2F7486); // mid teal from brand ramp
  static const Color primaryLight = Color(0xFF5E97A4);
  static const Color primaryLightest = Color(0xFFD9E6EA);

  // Neutral
  // Dark
  static const Color neutralDarkest = Color(0xFF0B2530);
  static const Color neutralDark = Color(0xFF123946);
  static const Color neutralMediumDark = Color(0xFF1C5060);
  static const Color neutralMedium = Color(0xFF2E6A7B);
  static const Color neutralMediumLight = Color(0xFF538A99);
  // Light
  static const Color neutralLight = khaki;
  static const Color neutralLighter = Color(0xFFDFCFA5);
  static const Color neutralLightAlt = Color(0xFFECE2C5);
  static const Color neutralLightest = krem;
  static const Color white = Color(0xFFFFFFFF);

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

  // Controls / Inputs
  static const Color inputSurface = Color(0xFFF8F9FE);
  static const Color inputBorder = Color(0xFFC5C6CC);
}
