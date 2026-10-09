/*
core/
└── extensions/
    ├── build_context_extensions.dart
    ├── string_extensions.dart
    ├── num_extensions.dart
    └── iterable_extensions.dart
    -------------------------------------
    import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
extension StringExtensions on String {
  bool get isNullOrEmpty => trim().isEmpty;

  String get capitalize {
    if (isEmpty) return this;

    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
*/