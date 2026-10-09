import 'package:get_it/get_it.dart';
import 'package:weather/config/di/network_module.dart';
import 'package:weather/config/environment/environment_config.dart';
import 'package:weather/config/environment/environment_loader.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Environment
  sl.registerSingleton<EnvironmentConfig>(EnvironmentLoader.load());

  // Storage
  // await setupStorageDependencies(sl);

  // Network
  
  setupNetworkDependencies(sl);

  //   sl.registerLazySingleton<GoRouter>(
  //   () => createAppRouter(
  //     // dependencies
  //   ),
  // );

  // sl.registerLazySingleton<ApiClient>(
  // () => DioApiClient(sl<Dio>()),

  // setupAuthDependencies(sl);
  // .
  // .
  // .
  // featurs
}
