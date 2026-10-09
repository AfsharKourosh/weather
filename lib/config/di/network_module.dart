import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/config/environment/environment_config.dart';
import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/core/network/client/dio_api_client.dart';
import 'package:weather/core/network/interceptors/logger_interceptor.dart';

void setupNetworkDependencies(GetIt sl) {
  sl.registerLazySingleton<Dio>(() {
    final environment = sl<EnvironmentConfig>();
    final dio = Dio(
      BaseOptions(
        baseUrl: environment.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll(
      [],
      // AuthInterceptor(
      //   sl<SecureStorage>(),
      // ),
    );

    if (environment.isDevelopment) {
      dio.interceptors.add(LoggerInterceptor());
    }
    return dio;
  });
  sl.registerLazySingleton<ApiClient>(() => DioApiClient(sl<Dio>()));
}
