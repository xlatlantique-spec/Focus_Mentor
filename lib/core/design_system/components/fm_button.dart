import 'package:flutter/material.dart';
import '../colors.dart';
import '../spacing.dart';
import '../typography.dart';

/// Primary elevated button for important actions.
///
/// Example:
/// ```dart
/// FMButton.primary(
///   label: 'Sign In',
///   onPressed: () {},
/// )
/// ```
class FMButton extends StatelessWidget {
  /// Button label text
  final String label;

  /// Called when button is pressed
  final VoidCallback? onPressed;

  /// Whether button is loading
  final bool isLoading;

  /// Button width (defaults to full width if not specified)
  final double? width;

  /// Custom icon to display before label
  final IconData? icon;

  /// Button size variant
  final FMButtonSize size;

  /// Button type/style
  final FMButtonType type;

  const FMButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.icon,
    this.size = FMButtonSize.medium,
    this.type = FMButtonType.primary,
  }) : super(key: key);

  /// Primary elevated button
  factory FMButton.primary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    IconData? icon,
    FMButtonSize size = FMButtonSize.medium,
  }) {
    return FMButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      icon: icon,
      size: size,
      type: FMButtonType.primary,
    );
  }

  /// Secondary outlined button
  factory FMButton.secondary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    IconData? icon,
    FMButtonSize size = FMButtonSize.medium,
  }) {
    return FMButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      icon: icon,
      size: size,
      type: FMButtonType.secondary,
    );
  }

  /// Tertiary text button
  factory FMButton.tertiary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    IconData? icon,
    FMButtonSize size = FMButtonSize.medium,
  }) {
    return FMButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      icon: icon,
      size: size,
      type: FMButtonType.tertiary,
    );
  }

  double get _height {
    switch (size) {
      case FMButtonSize.small:
        return 36;
      case FMButtonSize.medium:
        return 48;
      case FMButtonSize.large:
        return 56;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case FMButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case FMButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case FMButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  TextStyle get _textStyle {
    switch (size) {
      case FMButtonSize.small:
        return FMTypography.labelMedium();
      case FMButtonSize.medium:
        return FMTypography.labelLarge();
      case FMButtonSize.large:
        return FMTypography.titleMedium();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FMButtonType.primary:
        return _buildElevatedButton();
      case FMButtonType.secondary:
        return _buildOutlinedButton();
      case FMButtonType.tertiary:
        return _buildTextButton();
    }
  }

  Widget _buildElevatedButton() {
    return SizedBox(
      width: width,
      height: _height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: FMColors.primary,
          foregroundColor: FMColors.onPrimary,
          padding: _padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FMColors.onPrimary,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(label, style: _textStyle),
                ],
              ),
      ),
    );
  }

  Widget _buildOutlinedButton() {
    return SizedBox(
      width: width,
      height: _height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: FMColors.primary),
          foregroundColor: FMColors.primary,
          padding: _padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    FMColors.primary,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(label, style: _textStyle),
                ],
              ),
      ),
    );
  }

  Widget _buildTextButton() {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: FMColors.primary,
        padding: _padding,
      ),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  FMColors.primary,
                ),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: 4),
                ],
                Text(label, style: _textStyle),
              ],
            ),
    );
  }
}

/// Button size variants
enum FMButtonSize {
  small,
  medium,
  large,
}

/// Button type/style variants
enum FMButtonType {
  primary,
  secondary,
  tertiary,
}
