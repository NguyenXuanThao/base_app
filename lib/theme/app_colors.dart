import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Text Colors
  static const Color green1Color = Color(0xFF148133);
  static const Color green2Color = Color(0xFF1FA345);
  static const Color green3Color = Color(0xFF07571E);

  static const Color greyColor = Color(0xFFF1F1F1);
  static const Color grey2Color = Color(0xFF6C727F);
  static const Color grey3Color = Color(0xFFBABABA);
  static const Color grey4Color = Color(0xFF282828);
  static const Color grey5Color = Color(0xFFE4E4E4);
  static const Color grey6Color = Color(0xFFF6F6F6);

  static const Color orangeColor = Color(0xFFF88A09);

  static const Color bgTextFieldColor = Color(0xFFF9FAFB);

  static const Color redColor = Color(0xFFBF0E0E);

  static const LinearGradient gradient = LinearGradient(
    colors: [Color(0xFFF1C200), Color(0xFF0E9006)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
