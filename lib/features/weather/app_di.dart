/*
void setupAuthDependencies(GetIt sl) {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      sl<Dio>(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      sl<AuthRepository>(),
    ),
  );

  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      sl<LoginUseCase>(),
    ),
  );
}
*/