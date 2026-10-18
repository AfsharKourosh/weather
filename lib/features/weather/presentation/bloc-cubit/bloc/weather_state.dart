part of 'weather_bloc.dart';

class WeatherState {
  CurentWeatherStatus curentWeatherStatus;
  WeatherState({required this.curentWeatherStatus});

  WeatherState copyWith({CurentWeatherStatus? curentWeatherStatus}) {
    return WeatherState(
      curentWeatherStatus: curentWeatherStatus ?? this.curentWeatherStatus,
    );
  }
}
