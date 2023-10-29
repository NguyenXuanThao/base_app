import 'package:flutter/material.dart';

class BottomIndicatorNavigationBarItem {
  final String icon;
  final String label;
  final Color? backgroundColor;

  BottomIndicatorNavigationBarItem({
    required this.icon,
    required this.label,
    this.backgroundColor = Colors.transparent,
  });
}
