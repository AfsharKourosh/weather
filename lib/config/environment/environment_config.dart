import 'package:weather/config/environment/app_environment.dart';

class EnvironmentConfig {
  final AppEnvironment environment;
  final String baseUrl;
  final String secondaryBaseUrl;

  const EnvironmentConfig({required this.environment, required this.baseUrl, required this.secondaryBaseUrl});

  bool get isDevelopment => environment == AppEnvironment.development;

  bool get isStaging => environment == AppEnvironment.staging;

  bool get isProduction => environment == AppEnvironment.production;
}
