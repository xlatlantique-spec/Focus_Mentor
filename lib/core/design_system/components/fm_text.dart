import 'package:flutter/material.dart';
import '../typography.dart';

/// Reusable text widget with preset styles from the design system.
///
/// Example:
/// ```dart
/// FMText.titleLarge('Welcome to Focus Mentor')
/// FMText.bodyMedium('This is a body text')
/// ```
class FMText extends StatelessWidget {
  /// Text content
  final String text;

  /// Text style
  final TextStyle style;

  /// Text alignment
  final TextAlign textAlign;

  /// Maximum lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow overflow;

  const FMText(
    this.text, {
    Key? key,
    required this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  /// Display Large text (57sp)
  factory FMText.displayLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.displayLarge(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Display Medium text (45sp)
  factory FMText.displayMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.displayMedium(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Display Small text (36sp)
  factory FMText.displaySmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.displaySmall(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Headline Large text (32sp)
  factory FMText.headlineLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.headlineLarge(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Headline Medium text (28sp)
  factory FMText.headlineMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.headlineMedium(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Headline Small text (24sp)
  factory FMText.headlineSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.headlineSmall(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Title Large text (22sp)
  factory FMText.titleLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.titleLarge(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Title Medium text (16sp)
  factory FMText.titleMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.titleMedium(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Title Small text (14sp)
  factory FMText.titleSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.titleSmall(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Body Large text (16sp)
  factory FMText.bodyLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.bodyLarge(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Body Medium text (14sp)
  factory FMText.bodyMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.bodyMedium(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Body Small text (12sp)
  factory FMText.bodySmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.bodySmall(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Label Large text (14sp)
  factory FMText.labelLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.labelLarge(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Label Medium text (12sp)
  factory FMText.labelMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.labelMedium(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  /// Label Small text (11sp)
  factory FMText.labelSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return FMText(
      text,
      style: FMTypography.labelSmall(color: color),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
