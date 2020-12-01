import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF1C1C1C);
}

extension AppStyles on TextTheme {
  static TextStyle get basic => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
        color: AppColors.black,
      );
}
