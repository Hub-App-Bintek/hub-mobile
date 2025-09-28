import 'package:flutter/material.dart';

// This file will define your application's themes (light, dark, typography, color schemes)
// Adhering to Material Design 3 principles.

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.light),
      // Add other theme properties: typography, component themes etc.
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
      // Add other theme properties: typography, component themes etc.
    );
  }
}
