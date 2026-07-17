import 'package:flutter/material.dart';
import 'colors.dart';

/// Shadow definitions following Material 3 elevation system.
abstract class FMShadows {
  /// Elevation 1 shadow
  static const BoxShadow shadow1 = BoxShadow(
    color: FMColors.shadowLight,
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  /// Elevation 2 shadow
  static const BoxShadow shadow2 = BoxShadow(
    color: FMColors.shadowLight,
    blurRadius: 6,
    offset: Offset(0, 2),
  );

  /// Elevation 3 shadow
  static const BoxShadow shadow3 = BoxShadow(
    color: FMColors.shadowLight,
    blurRadius: 12,
    offset: Offset(0, 4),
  );

  /// Elevation 4 shadow
  static const BoxShadow shadow4 = BoxShadow(
    color: FMColors.shadowLight,
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  /// Elevation 5 shadow
  static const BoxShadow shadow5 = BoxShadow(
    color: FMColors.shadowDark,
    blurRadius: 24,
    offset: Offset(0, 12),
  );

  /// List of shadows for common elevations
  static const List<BoxShadow> shadowList1 = [shadow1];
  static const List<BoxShadow> shadowList2 = [shadow2];
  static const List<BoxShadow> shadowList3 = [shadow3];
  static const List<BoxShadow> shadowList4 = [shadow4];
  static const List<BoxShadow> shadowList5 = [shadow5];

  /// Dark theme shadow for light surfaces
  static const BoxShadow shadowDark1 = BoxShadow(
    color: Color(0x29000000),
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  static const BoxShadow shadowDark2 = BoxShadow(
    color: Color(0x29000000),
    blurRadius: 6,
    offset: Offset(0, 2),
  );
}
