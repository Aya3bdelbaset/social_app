import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF5151C6);
  static const Color primaryLight = Color(0xFF888BF4);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLight,
      primary,
    ],
  );

  // Base
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Backgrounds
  static const Color background = Color(0xFFF9F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color inputBackground = Color(0xFFF5F5F8);

  // Text
  static const Color textPrimary = Color(0xFF1F1F2C);
  static const Color textSecondary = Color(0xFF777783);
  static const Color textHint = Color(0xFFA4A4AF);
  static const Color textDisabled = Color(0xFFC5C5CC);

  // Borders
  static const Color border = Color(0xFFE7E7ED);
  static const Color borderFocused = primary;

  // States
  static const Color error = Color(0xFFE5484D);
  static const Color success = Color(0xFF35A66F);
  static const Color warning = Color(0xFFF0A43C);

  // Overlays
  static const Color overlay = Color(0x66000000);
}