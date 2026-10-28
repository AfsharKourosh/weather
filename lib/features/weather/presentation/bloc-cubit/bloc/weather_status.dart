import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';

sealed class WeatherStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherLoading extends WeatherStatus {}

final class WeatherCompleted extends WeatherStatus {
  final WeatherResEntity weatherResEntity;
  WeatherCompleted(this.weatherResEntity);

  @override
  List<Object?> get props => [weatherResEntity];
}

final class WeatherError extends WeatherStatus {
  final String? message;
  WeatherError(this.message);
  @override
  List<Object?> get props => [message];
}
