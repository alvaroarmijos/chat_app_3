import 'package:chat_app_3/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Theme data and related methods would be defined here

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    ).copyWith(
      inputDecorationTheme: InputDecorationThemeData(
        labelStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
