import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/entitys/search_box_res_entity.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherResEntity>> curentWeather(
    WeatherReqModel weatherReqModel,
  );
  Future<Either<Failure, SearchBoxResEntity>> searchBox(String prefix);
}
