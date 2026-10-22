import 'package:weather/config/environment/app_environment.dart';
import 'package:weather/config/environment/environment_config.dart';

class EnvironmentLoader {
  static const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.openweathermap.org',
  );

  static EnvironmentConfig load() {
    final resolvedBaseUrl = baseUrl.trim().isEmpty
        ? 'https://api.openweathermap.org'
        : baseUrl;

    return EnvironmentConfig(
      environment: switch (environment.trim().toLowerCase()) {
        'development' => AppEnvironment.development,
        'staging' => AppEnvironment.staging,
        'production' => AppEnvironment.production,
        _ => throw UnsupportedError('Unknown environment: $environment'),
      },
      baseUrl: resolvedBaseUrl,
    );
  }
}
