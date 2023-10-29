import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_theme.dart';

class CustomTheme {
  CustomTheme();

  ThemeData? appTheme;

  factory CustomTheme.fromContext(BuildContext context) {
    final CustomTheme theme = CustomTheme();

    theme.appTheme = ThemeData(
      primaryColor: AppColors.green2Color,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Lexend',
      textTheme: TextTheme(
        bodyMedium: AppTheme.of(context).regular,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        height: 56.0,
        buttonColor: AppColors.green2Color,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.transparent, brightness: Brightness.light)
          .copyWith(background: Colors.white),
    );

    return theme;
  }
}
