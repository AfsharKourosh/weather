
import 'package:weather/core/error/exceptions/app_exception.dart';

class ServerException extends AppException {
  const ServerException(
    super.message, {
    super.statusCode,
  });
}