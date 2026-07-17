import 'package:flutter/material.dart';
import '../colors.dart';
import '../spacing.dart';
import 'fm_icon.dart';

/// Bottom navigation bar component for multi-tab navigation.
///
/// Example:
/// ```dart
/// FMBottomNavigation(
///   items: [
///     FMBottomNavigationItem(
///       icon: Icons.home,
///       label: 'Home',
///     ),
///     FMBottomNavigationItem(
///       icon: Icons.gallery,
///       label: 'Gallery',
///     ),
///   ],
///   currentIndex: 0,
///   onTap: (index) {},
/// )
/// ```
class FMBottomNavigation extends StatelessWidget {
  /// Navigation items
  final List<FMBottomNavigationItem> items;

  /// Currently selected index
  final int currentIndex;

  /// On item tap callback
  final ValueChanged<int> onTap;

  /// Background color
  final Color? backgroundColor;

  /// Icon color
  final Color? iconColor;

  /// Selected icon color
  final Color? selectedIconColor;

  /// Label text color
  final Color? labelColor;

  /// Selected label text color
  final Color? selectedLabelColor;

  const FMBottomNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.selectedIconColor,
    this.labelColor,
    this.selectedLabelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: FMIcon(
                item.icon,
                size: 24,
              ),
              activeIcon: FMIcon(
                item.activeIcon ?? item.icon,
                size: 24,
                color: selectedIconColor ?? FMColors.primary,
              ),
              label: item.label,
            ),
          )
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor:
          backgroundColor ??
          (isDark ? FMColors.surfaceDark : FMColors.surfaceLight),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedItemColor: selectedIconColor ?? FMColors.primary,
      unselectedItemColor: iconColor ?? FMColors.textMedium,
      selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
    );
  }
}

/// Bottom navigation item model
class FMBottomNavigationItem {
  /// Icon for unselected state
  final IconData icon;

  /// Icon for selected state (optional, defaults to icon)
  final IconData? activeIcon;

  /// Label text
  final String label;

  const FMBottomNavigationItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}
