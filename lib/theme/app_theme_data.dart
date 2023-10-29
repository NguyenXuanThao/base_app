import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppThemeData with Diagnosticable {
  AppThemeData();

  late TextStyle thin;
  late TextStyle extraLight;
  late TextStyle light;
  late TextStyle regular;
  late TextStyle medium;
  late TextStyle semiBold;
  late TextStyle bold;
  late TextStyle extraBold;
  late TextStyle black;

  late double defaultPadding = 20;

  factory AppThemeData.fromContext(BuildContext context) {
    final AppThemeData theme = AppThemeData();

    theme.thin = const TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w100,
        fontSize: 14.0,
        color: Colors.black);

    theme.extraLight = theme.thin.copyWith(fontWeight: FontWeight.w200);
    theme.light = theme.thin.copyWith(fontWeight: FontWeight.w300);
    theme.regular = theme.thin.copyWith(fontWeight: FontWeight.w400);
    theme.medium = theme.thin.copyWith(fontWeight: FontWeight.w500);
    theme.semiBold = theme.thin.copyWith(fontWeight: FontWeight.w600);
    theme.bold = theme.thin.copyWith(fontWeight: FontWeight.w700);
    theme.extraBold = theme.thin.copyWith(fontWeight: FontWeight.w800);
    theme.black = theme.thin.copyWith(fontWeight: FontWeight.w900);
    return theme;
  }
}
