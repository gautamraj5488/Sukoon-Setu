import 'package:flutter/material.dart';

class AppColors {
  // Common (used in both themes)
  static const Color primary = Color(0xFFFF9800);      // Orange
  static const Color primaryDark = Color(0xFFF57C00);  // Darker orange
  static const Color primaryLight = Color(0xFFFFB74D); // Lighter orange

  // Light Theme
  static const Color lightBackground = Color(0xFFFDF6F0);
  static const Color lightSurface = Colors.white;
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);

  // Dark Theme
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFBDBDBD);

  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
}
