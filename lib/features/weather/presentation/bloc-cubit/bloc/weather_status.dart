import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';

sealed class CurentWeatherStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurentWeatherLoading extends CurentWeatherStatus {}

class CurentWeatherCompleted extends CurentWeatherStatus {
  final WeatherResEntity weatherResEntity;
  CurentWeatherCompleted(this.weatherResEntity);

  @override
  List<Object?> get props => [weatherResEntity];
}

class CurentWeatherError extends CurentWeatherStatus {
  final String? message;
  CurentWeatherError(this.message);
  @override
  List<Object?> get props => [message];
}
