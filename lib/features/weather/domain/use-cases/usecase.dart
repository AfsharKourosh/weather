/*
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParams> {

  final AuthRepository repository;


  LoginUseCase(this.repository);


  @override
  Future<Either<Failure, UserEntity>> call(
    LoginParams params,
  ) async {

    return await repository.login(params);

  }
}
--------------------------------------------------
class LoginParams {

  final String phone;

  const LoginParams({
    required this.phone,
  });

}
*/