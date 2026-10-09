/*
core/
└── helpers/
    ├── date_time_helper.dart
    ├── validation_helper.dart
    └── debounce_helper.dart
    -----------------------------------
    abstract final class DateTimeHelper {
  static bool isToday(DateTime date) {
    final now = DateTime.now();

    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
abstract final class ValidationHelper {
  static bool isValidEmail(String value) {
    return RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(value);
  }
}
*/