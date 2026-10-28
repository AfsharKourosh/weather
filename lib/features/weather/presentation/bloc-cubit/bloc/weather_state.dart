part of 'weather_bloc.dart';

class WeatherState {
  WeatherState(this.weatherStatus);

  final WeatherStatus weatherStatus;

  WeatherState copyWith(WeatherStatus? weatherStatus) {
    return WeatherState(weatherStatus ?? this.weatherStatus);
  }
}
