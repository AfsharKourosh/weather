import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/date/model/search_box_res_model.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherResEntity>> curentWeather(
    WeatherReqModel weatherReqModel,
  );
  Future<Either<Failure, List<Datum>>> searchBox(String prefix);
}
