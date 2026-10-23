
import 'package:flutter/material.dart';
import 'package:weather/config/theme/app_colors.dart';
import 'package:weather/config/theme/app_text_theme.dart';

abstract final class AppTheme {


  static final ThemeData light = _buildLightTheme();
  // static final ThemeData dark = _buildDarkTheme();



static ThemeData _buildLightTheme(){
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,

    );

return ThemeData(   
      colorScheme: colorScheme,
      textTheme: AppTextThemes.light,
      
      useMaterial3: true,
      
      
      
      
      
      );}


// static ThemeData _buildDarkTheme(){return ThemeData();}

}
