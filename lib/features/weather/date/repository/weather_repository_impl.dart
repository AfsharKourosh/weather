import 'package:dartz/dartz.dart';
import 'package:weather/core/error/exceptions/execute_with_failure.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/date/data-source/remote/weather_data_source.dart';
import 'package:weather/features/weather/date/model/search_box_res_model.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';
import 'package:weather/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl(this.weatherDataSource);

  @override
  Future<Either<Failure, WeatherResEntity>> curentWeather(
    WeatherReqModel weatherReqModel,
  ) {
    return executeWithFailure(
      () async =>
          (await weatherDataSource.curentWeather(weatherReqModel)).toEntity(),
    );
  }

  @override
  Future<Either<Failure, List<Datum>>> searchBox(String prefix) {
    return executeWithFailure(() => weatherDataSource.searchBox(prefix));
  }
}
