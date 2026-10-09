/*
connectionTimeout
sendTimeout
receiveTimeout
connectionError
*/
import 'package:weather/core/error/exceptions/app_exception.dart';

class NetworkException extends AppException {
  const NetworkException(super.message, {super.statusCode});
}
