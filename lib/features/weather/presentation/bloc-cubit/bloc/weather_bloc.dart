import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<CurentWeather>((event, emit) {});
  }
}
