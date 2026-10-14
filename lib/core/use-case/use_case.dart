import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';

abstract interface class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams {
  const NoParams();
}
