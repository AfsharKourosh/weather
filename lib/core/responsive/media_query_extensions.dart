/*
core/
└── responsive/
    ├── media_query_extensions.dart
    ├── responsive.dart
    └── font_responsive.dart
    -------------------------------
import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;
}
 
*/