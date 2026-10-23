// Localization
//       +
// Font
//       ↓
// AppTextStyles
//       ↓
// AppTheme

import 'package:flutter/material.dart';
import 'package:weather/config/theme/app_colors.dart';

abstract final class AppTextThemes {
  static TextTheme light = const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 50,
      fontWeight: FontWeight(500),
    ),
    bodyMedium: TextStyle(
      color: AppColors.onPrimary,
      fontSize: 20,
      fontWeight: FontWeight(300),
    ),
    bodySmall: TextStyle(
      color: AppColors.onPrimary,
      fontSize: 20,
      fontWeight: FontWeight(300),
    ),
  );

  // static TextTheme dark = const TextTheme(

  // );
}
