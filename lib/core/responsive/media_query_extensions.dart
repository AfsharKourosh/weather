import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;
}
