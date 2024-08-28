import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: Colors.white),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(primary: Colors.black),
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
