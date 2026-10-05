/*
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, OtpResponseEntity>> otp(
    OtpRequest params,
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
*/