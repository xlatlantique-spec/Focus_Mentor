import 'package:flutter/material.dart';
import '../colors.dart';
import '../shadows.dart';

/// Reusable card component for grouping content.
///
/// Example:
/// ```dart
/// FMCard(
///   child: Column(
///     children: [...],
///   ),
/// )
/// ```
class FMCard extends StatelessWidget {
  /// Content of the card
  final Widget child;

  /// Padding inside card
  final EdgeInsets padding;

  /// Card elevation/shadow
  final double elevation;

  /// Border radius
  final BorderRadius borderRadius;

  /// Background color
  final Color? backgroundColor;

  /// Card border
  final Border? border;

  /// On tap callback
  final VoidCallback? onTap;

  /// Whether card is clickable
  final bool clickable;

  const FMCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.elevation = 2,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.backgroundColor,
    this.border,
    this.onTap,
    this.clickable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget cardContent = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDark ? FMColors.surfaceDark : FMColors.surfaceLight),
        borderRadius: borderRadius,
        border: border,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: isDark
                      ? FMColors.shadowDark
                      : FMColors.shadowLight,
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                )
              ]
            : null,
      ),
      child: child,
    );

    if (clickable || onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
