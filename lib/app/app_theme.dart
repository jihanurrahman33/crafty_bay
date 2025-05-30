import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
      ),
    );
  }
}
