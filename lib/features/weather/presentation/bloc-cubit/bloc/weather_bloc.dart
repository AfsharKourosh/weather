import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/domain/use-case/weather_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_status.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherBloc(this.weatherUseCase) : super(WeatherState(WeatherLoading())) {
    on<GetCurentWeather>((event, emit) async {
      emit(state.copyWith(WeatherLoading()));

      final result = await weatherUseCase(event.weatherReqModel);

      result.fold(
        (failure) {
          emit(state.copyWith(WeatherError(failure.message)));
        },
        (weather) {
          emit(state.copyWith(WeatherCompleted(weather)));
        },
      );
    });
  }
}
