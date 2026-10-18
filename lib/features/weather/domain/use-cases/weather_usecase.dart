import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';
import 'package:weather/features/weather/domain/repositorys/weather_repository.dart';

///class WeatherUseCase implements UseCase<Res, Req>
class WeatherUseCase implements UseCase<WeatherResEntity, WeatherReqModel> {
  final WeatherRepository _weatherRepository;

  WeatherUseCase(this._weatherRepository);

  @override
  Future<Either<Failure, WeatherResEntity>> call(
    WeatherReqModel weatherReqModel,
  ) {
    return _weatherRepository.curentWeather(weatherReqModel);
  }
}
