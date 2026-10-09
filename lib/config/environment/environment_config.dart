import 'package:weather/config/environment/app_environment.dart';

class EnvironmentConfig {
  final AppEnvironment environment;
  final String baseUrl;

  const EnvironmentConfig({required this.environment, required this.baseUrl});

  bool get isDevelopment => environment == AppEnvironment.development;

  bool get isStaging => environment == AppEnvironment.staging;

  bool get isProduction => environment == AppEnvironment.production;
}
