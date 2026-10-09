import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
