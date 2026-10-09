import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather/config/environment/environment_config.dart';
import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/core/network/client/dio_api_client.dart';
import 'package:weather/core/network/connectivity/connectivity_service.dart';

void setupNetworkDependencies(GetIt sl) {
  sl.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(Connectivity()),
  );
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
      [if (environment.isDevelopment) PrettyDioLogger()],
      // AuthInterceptor(
      //   sl<SecureStorage>(),
      // ),
    );

    return dio;
  });
  sl.registerLazySingleton<ApiClient>(() => DioApiClient(sl<Dio>()));
}
