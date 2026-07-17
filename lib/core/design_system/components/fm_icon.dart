import 'package:flutter/material.dart';

/// Icon wrapper for consistent icon usage throughout the app.
///
/// Example:
/// ```dart
/// FMIcon(Icons.home)
/// FMIcon(Icons.search, size: 24, color: Colors.red)
/// ```
class FMIcon extends StatelessWidget {
  /// Icon data
  final IconData icon;

  /// Icon size
  final double size;

  /// Icon color
  final Color? color;

  /// Semantic label
  final String? semanticLabel;

  /// Icon fit
  final BoxFit fit;

  /// Icon alignment
  final Alignment alignment;

  const FMIcon(
    this.icon, {
    Key? key,
    this.size = 24,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color ?? Theme.of(context).iconTheme.color,
      semanticLabel: semanticLabel,
    );
  }
}
