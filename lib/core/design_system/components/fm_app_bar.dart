import 'package:flutter/material.dart';
import '../colors.dart';

/// Reusable app bar component following Material 3 design.
///
/// Example:
/// ```dart
/// FMAppBar(
///   title: 'Screen Title',
///   actions: [
///     IconButton(icon: Icon(Icons.search), onPressed: () {}),
///   ],
/// )
/// ```
class FMAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title of the app bar
  final String? title;

  /// Title widget (if title is not a string)
  final Widget? titleWidget;

  /// Leading widget (usually back button)
  final Widget? leading;

  /// Action widgets (icons on the right)
  final List<Widget>? actions;

  /// Whether to show back button
  final bool showBackButton;

  /// Back button callback
  final VoidCallback? onBackPressed;

  /// App bar elevation
  final double elevation;

  /// Background color
  final Color? backgroundColor;

  /// Title text color
  final Color? titleColor;

  /// Center title
  final bool centerTitle;

  /// Bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  const FMAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.elevation = 0,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = true,
    this.bottom,
  })  : assert(title == null || titleWidget == null,
            'Cannot provide both title and titleWidget'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: titleColor ??
                            (isDark
                                ? FMColors.textLight
                                : FMColors.textDark),
                      ),
                )
              : null),
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
      elevation: elevation,
      backgroundColor:
          backgroundColor ??
          (isDark ? FMColors.backgroundDark : FMColors.backgroundLight),
      centerTitle: centerTitle,
      bottom: bottom,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}
