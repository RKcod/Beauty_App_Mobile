import 'package:flutter/material.dart';

class BarItem {
  /// The text that will be displayed on the bar item.
  final String text;

  /// Selected or active icon must be filled icon and complementary to inactive icon.
  final IconData filledIcon;

  /// Normal or inactive icon must be outlined icon and complementary to active icon.
  final IconData outlinedIcon;
  BarItem({
    required this.text,
    required this.filledIcon,
    required this.outlinedIcon,
  });
}
