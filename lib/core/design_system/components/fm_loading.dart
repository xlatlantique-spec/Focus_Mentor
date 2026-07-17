import 'package:flutter/material.dart';
import '../colors.dart';
import '../spacing.dart';
import 'fm_text.dart';

/// Loading indicator component with multiple variants.
///
/// Example:
/// ```dart
/// FMLoading()
/// FMLoading.overlay(child: MyWidget())
/// FMLoading.skeleton(width: 100, height: 20)
/// ```
class FMLoading extends StatelessWidget {
  /// Loading type
  final FMLoadingType type;

  /// Size of the indicator
  final double size;

  /// Custom message
  final String? message;

  /// Child widget (for overlay type)
  final Widget? child;

  /// Show loading
  final bool show;

  const FMLoading({
    Key? key,
    this.type = FMLoadingType.circular,
    this.size = 40,
    this.message,
    this.child,
    this.show = true,
  }) : super(key: key);

  /// Circular loading indicator
  factory FMLoading.circular({
    double size = 40,
    String? message,
    bool show = true,
  }) {
    return FMLoading(
      type: FMLoadingType.circular,
      size: size,
      message: message,
      show: show,
    );
  }

  /// Linear loading indicator
  factory FMLoading.linear({
    String? message,
    bool show = true,
  }) {
    return FMLoading(
      type: FMLoadingType.linear,
      message: message,
      show: show,
    );
  }

  /// Full-screen loading overlay
  factory FMLoading.overlay({
    required Widget child,
    bool show = true,
    String? message,
  }) {
    return FMLoading(
      type: FMLoadingType.overlay,
      child: child,
      show: show,
      message: message,
    );
  }

  /// Skeleton loading placeholder
  factory FMLoading.skeleton({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return FMLoading(
      type: FMLoadingType.skeleton,
      size: width,
      child: _SkeletonLoader(
        width: width,
        height: height,
        borderRadius: borderRadius,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!show) return child ?? const SizedBox.shrink();

    switch (type) {
      case FMLoadingType.circular:
        return _buildCircularLoading();
      case FMLoadingType.linear:
        return _buildLinearLoading();
      case FMLoadingType.overlay:
        return _buildOverlay();
      case FMLoadingType.skeleton:
        return child ?? const SizedBox.shrink();
    }
  }

  Widget _buildCircularLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(
                FMColors.primary,
              ),
            ),
          ),
          if (message != null) ...[
            SizedBox(height: FMSpacing.md),
            FMText.bodyMedium(message!),
          ],
        ],
      ),
    );
  }

  Widget _buildLinearLoading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinearProgressIndicator(
          backgroundColor: FMColors.borderColor,
          valueColor: const AlwaysStoppedAnimation<Color>(
            FMColors.primary,
          ),
        ),
        if (message != null) ...[
          SizedBox(height: FMSpacing.md),
          FMText.bodyMedium(message!),
        ],
      ],
    );
  }

  Widget _buildOverlay() {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        Container(
          color: Colors.black26,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FMColors.primary,
                  ),
                ),
                if (message != null) ...[
                  SizedBox(height: FMSpacing.md),
                  FMText.bodyMedium(message!),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Loading type variants
enum FMLoadingType {
  circular,
  linear,
  overlay,
  skeleton,
}

/// Skeleton loading widget
class _SkeletonLoader extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const _SkeletonLoader({
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  State<_SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<_SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius:
                widget.borderRadius ?? BorderRadius.circular(8),
            color: Colors.grey[300],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ],
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
            ),
          ),
        );
      },
    );
  }
}
