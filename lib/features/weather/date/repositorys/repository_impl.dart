
import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/date/data-sources/remote/remote_data_source.dart';
import 'package:weather/features/weather/domain/entitys/entity.dart';
import 'package:weather/features/weather/domain/repositorys/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, OtpResponseEntity>> otp(
    String params,
  ) async {
    try {
      final model = await remoteDataSource.otp(
        params.toModel(),
      );

      return Right(
        model.toEntity(),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(e.message),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    } on AppException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    }
  }
}
