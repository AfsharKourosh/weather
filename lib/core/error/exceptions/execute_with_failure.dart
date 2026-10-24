import 'package:dartz/dartz.dart';
import 'package:weather/core/error/exceptions/app_exception.dart';
import 'package:weather/core/error/exceptions/network_exception.dart';
import 'package:weather/core/error/exceptions/server_exception.dart';
import 'package:weather/core/error/failures/failure.dart';

Future<Either<Failure, T>> executeWithFailure<T>(
  Future<T> Function() action,
) async {
  try {
    return Right(await action());
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on AppException catch (e) {
    return Left(ServerFailure(e.message));
  }
}
