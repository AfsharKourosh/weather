
// core/
// └── error/
//     ├── exceptions/
//     │   ├── app_exception.dart
//     │   ├── network_exception.dart
//     │   └── server_exception.dart
//     │
//     └── failures/
//         ├── failure.dart
//         ├── server_failure.dart
//         ├── network_failure.dart
//         └── cache_failure.dart

abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(
    this.message, {
    this.statusCode,
  });

  @override
  String toString() => message;
}




