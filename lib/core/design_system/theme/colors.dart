import 'package:flutter/material.dart';

/// Application color palette following Material 3 design guidelines.
///
/// Supports both light and dark themes with proper contrast ratios.
abstract class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF6366F1);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFEEF0FE);
  static const Color onPrimaryContainer = Color(0xFF1E1B4B);

  // Secondary colors
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFF3E8FF);
  static const Color onSecondaryContainer = Color(0xFF5B21B6);

  // Tertiary colors
  static const Color tertiary = Color(0xFF06B6D4);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFCFFAFE);
  static const Color onTertiaryContainer = Color(0xFF164E63);

  // Surface colors
  static const Color surface = Color(0xFFFEFEFE);
  static const Color onSurface = Color(0xFF1F2937);
  static const Color surfaceLight = Color(0xFFFAFAFA);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Background colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF0F172A);

  // State colors
  static const Color error = Color(0xFFDC2626);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFEE2E2);
  static const Color onErrorContainer = Color(0xFF7F1D1D);

  static const Color success = Color(0xFF10B981);
  static const Color onSuccess = Color(0xFFFFFFFF);

  static const Color warning = Color(0xFFF59E0B);
  static const Color onWarning = Color(0xFFFFFFFF);

  static const Color info = Color(0xFF3B82F6);
  static const Color onInfo = Color(0xFFFFFFFF);

  // Text colors
  static const Color textDark = Color(0xFF1F2937);
  static const Color textLight = Color(0xFFF3F4F6);
  static const Color textMedium = Color(0xFF6B7280);
  static const Color textMediumDark = Color(0xFFA1A5B0);

  // Border color
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color borderColorDark = Color(0xFF374151);

  // Disabled colors
  static const Color disabled = Color(0xFFD1D5DB);
  static const Color onDisabled = Color(0xFF9CA3AF);

  // Shadow colors
  static const Color shadow = Color(0x14000000);
  static const Color shadowDark = Color(0x29000000);
}
