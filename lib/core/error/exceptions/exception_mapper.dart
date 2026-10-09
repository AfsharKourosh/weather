import 'package:dio/dio.dart';
import 'package:weather/core/error/exceptions/network_exception.dart';
import 'package:weather/core/error/exceptions/server_exception.dart';

abstract final class ExceptionMapper {
  static Exception map(DioException exception) {
    final response = exception.response;

    if (response != null) {
      final statusCode = response.statusCode;

      if (statusCode != null && statusCode >= 500) {
        return ServerException(
          _extractMessage(response),
          statusCode: statusCode,
        );
      }

      if (statusCode == 401) {
        return ServerException('Unauthorized', statusCode: statusCode);
      }

      if (statusCode == 403) {
        return ServerException('Forbidden', statusCode: statusCode);
      }

      if (statusCode == 404) {
        return ServerException('Resource not found', statusCode: statusCode);
      }

      if (statusCode! >= 400) {
        return ServerException(
          _extractMessage(response),
          statusCode: statusCode,
        );
      }
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Connection timeout');

      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection');

      case DioExceptionType.cancel:
        return const NetworkException('Request cancelled');

      default:
        return NetworkException(exception.message ?? 'Network error');
    }
  }

  static String _extractMessage(Response response) {
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final message = data['message'];

      if (message is String && message.isNotEmpty) {
        return message;
      }
    }

    return 'Something went wrong';
  }
}
