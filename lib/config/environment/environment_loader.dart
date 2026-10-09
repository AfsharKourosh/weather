import 'package:weather/config/environment/app_environment.dart';
import 'package:weather/config/environment/environment_config.dart';

class EnvironmentLoader {
  static const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  static const baseUrl = String.fromEnvironment('BASE_URL');

  static EnvironmentConfig load() {
    return EnvironmentConfig(
      environment: switch (environment) {
        'development' => AppEnvironment.development,
        'staging' => AppEnvironment.staging,
        'production' => AppEnvironment.production,
        _ => throw UnsupportedError('Unknown environment: $environment'),
      },
      baseUrl: baseUrl,
    );
  }
}
