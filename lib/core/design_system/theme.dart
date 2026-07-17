import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

/// Application theme configuration for Material 3.
///
/// Provides both light and dark themes with consistent Material 3 design.
/// Uses Google Fonts (Poppins) for typography.
abstract class FMTheme {
  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: FMColors.primary,
        brightness: Brightness.light,
      ),
      textTheme: FMTypography.lightTextTheme,
      appBarTheme: _buildAppBarTheme(Brightness.light),
      elevatedButtonTheme: _buildElevatedButtonTheme(Brightness.light),
      outlinedButtonTheme: _buildOutlinedButtonTheme(Brightness.light),
      textButtonTheme: _buildTextButtonTheme(Brightness.light),
      inputDecorationTheme: _buildInputDecorationTheme(Brightness.light),
      cardTheme: _buildCardTheme(Brightness.light),
      scaffoldBackgroundColor: FMColors.backgroundLight,
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: FMColors.primary,
        brightness: Brightness.dark,
      ),
      textTheme: FMTypography.darkTextTheme,
      appBarTheme: _buildAppBarTheme(Brightness.dark),
      elevatedButtonTheme: _buildElevatedButtonTheme(Brightness.dark),
      outlinedButtonTheme: _buildOutlinedButtonTheme(Brightness.dark),
      textButtonTheme: _buildTextButtonTheme(Brightness.dark),
      inputDecorationTheme: _buildInputDecorationTheme(Brightness.dark),
      cardTheme: _buildCardTheme(Brightness.dark),
      scaffoldBackgroundColor: FMColors.backgroundDark,
    );
  }

  /// Build AppBarTheme based on brightness
  static AppBarTheme _buildAppBarTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return AppBarTheme(
      elevation: 0,
      backgroundColor:
          isLight ? FMColors.backgroundLight : FMColors.backgroundDark,
      foregroundColor: isLight ? FMColors.textDark : FMColors.textLight,
      centerTitle: true,
      titleTextStyle: FMTypography.headlineSmall(
        color: isLight ? FMColors.textDark : FMColors.textLight,
      ),
    );
  }

  /// Build ElevatedButtonThemeData based on brightness
  static ElevatedButtonThemeData _buildElevatedButtonTheme(
    Brightness brightness,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: FMColors.primary,
        foregroundColor: FMColors.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: FMTypography.labelLarge(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Build OutlinedButtonThemeData based on brightness
  static OutlinedButtonThemeData _buildOutlinedButtonTheme(
    Brightness brightness,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: FMColors.primary),
        foregroundColor: FMColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: FMTypography.labelLarge(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Build TextButtonThemeData based on brightness
  static TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: FMColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: FMTypography.labelLarge(),
      ),
    );
  }

  /// Build InputDecorationTheme based on brightness
  static InputDecorationTheme _buildInputDecorationTheme(
    Brightness brightness,
  ) {
    final isLight = brightness == Brightness.light;
    return InputDecorationTheme(
      filled: true,
      fillColor: isLight ? FMColors.surfaceLight : FMColors.surfaceDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FMColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FMColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FMColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FMColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FMColors.error, width: 2),
      ),
      labelStyle: FMTypography.bodyMedium(
        color: isLight ? FMColors.textMedium : FMColors.textMediumDark,
      ),
      hintStyle: FMTypography.bodyMedium(
        color: isLight ? FMColors.textMedium : FMColors.textMediumDark,
      ),
    );
  }

  /// Build CardTheme based on brightness
  static CardTheme _buildCardTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return CardTheme(
      color: isLight ? FMColors.surfaceLight : FMColors.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
