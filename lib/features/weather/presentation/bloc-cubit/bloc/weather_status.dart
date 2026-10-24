import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';

sealed class CurentWeatherStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CurentWeatherLoading extends CurentWeatherStatus {}

final class CurentWeatherCompleted extends CurentWeatherStatus {
  final WeatherResEntity weatherResEntity;
  CurentWeatherCompleted(this.weatherResEntity);

  @override
  List<Object?> get props => [weatherResEntity];
}

final class CurentWeatherError extends CurentWeatherStatus {
  final String? message;
  CurentWeatherError(this.message);
  @override
  List<Object?> get props => [message];
}
