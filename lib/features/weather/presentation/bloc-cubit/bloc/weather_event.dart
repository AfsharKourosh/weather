part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}
class CurentWeather extends WeatherEvent {
  final WeatherReqModel weatherReqModel;

  const CurentWeather(this.weatherReqModel);
  
}