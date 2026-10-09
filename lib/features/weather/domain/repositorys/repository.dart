
import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/domain/entitys/entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, OtpResponseEntity>> otp(
    String params,
  );
}
